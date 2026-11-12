//===- RangeAttrsToMetadata.cpp - Range compatibility lowering --------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "llvm/Transforms/Utils/RangeAttrsToMetadata.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/ConstantRange.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/Module.h"
#include <optional>
#include <utility>

using namespace llvm;

namespace {

constexpr StringLiteral RangeCarrier = "llvm-irformatter.range";

std::optional<ConstantRange> getAttributeRange(Attribute Range, Type *Ty) {
  if (!Range.isValid() || !Ty->isIntOrIntVectorTy())
    return std::nullopt;

  SmallVector<StringRef, 3> Parts;
  Range.getValueAsString().split(Parts, ':');
  unsigned BitWidth;
  APInt Lower, Upper;
  if (Parts.size() != 3 || Parts[0].getAsInteger(10, BitWidth) ||
      BitWidth != Ty->getScalarSizeInBits() ||
      Parts[1].getAsInteger(10, Lower) || Parts[2].getAsInteger(10, Upper) ||
      Lower.getActiveBits() > BitWidth || Upper.getActiveBits() > BitWidth)
    return std::nullopt;

  Lower = Lower.zextOrTrunc(BitWidth);
  Upper = Upper.zextOrTrunc(BitWidth);
  return ConstantRange(Lower, Upper);
}

// Linear, unsigned half-open intervals use one extra bit to represent 2^W.
// Unlike ConstantRange, a list can retain disconnected intersections exactly.
struct Interval {
  APInt Lower;
  APInt Upper;
};
using RangeList = SmallVector<Interval, 4>;

void appendRange(RangeList &Ranges, const ConstantRange &Range) {
  if (Range.isEmptySet())
    return;

  unsigned Width = Range.getBitWidth() + 1;
  APInt Limit = APInt::getOneBitSet(Width, Width - 1);
  if (Range.isFullSet()) {
    Ranges.push_back({APInt(Width, 0), Limit});
    return;
  }

  APInt Lower = Range.getLower().zext(Width);
  APInt Upper = Range.getUpper().zext(Width);
  if (Lower.ult(Upper)) {
    Ranges.push_back({Lower, Upper});
  } else {
    if (!Upper.isZero())
      Ranges.push_back({APInt(Width, 0), Upper});
    Ranges.push_back({Lower, Limit});
  }
}

void normalizeRanges(RangeList &Ranges) {
  llvm::sort(Ranges, [](const Interval &A, const Interval &B) {
    return A.Lower.ult(B.Lower);
  });
  RangeList Merged;
  for (const Interval &Range : Ranges) {
    if (Merged.empty() || Merged.back().Upper.ult(Range.Lower))
      Merged.push_back(Range);
    else if (Merged.back().Upper.ult(Range.Upper))
      Merged.back().Upper = Range.Upper;
  }
  Ranges = std::move(Merged);
}

RangeList intersectRanges(const RangeList &Left, const ConstantRange &Range) {
  RangeList Right;
  appendRange(Right, Range);
  RangeList Result;
  unsigned I = 0, J = 0;
  while (I < Left.size() && J < Right.size()) {
    APInt Lower = Left[I].Lower.ugt(Right[J].Lower) ? Left[I].Lower
                                                  : Right[J].Lower;
    APInt Upper = Left[I].Upper.ult(Right[J].Upper) ? Left[I].Upper
                                                  : Right[J].Upper;
    if (Lower.ult(Upper))
      Result.push_back({Lower, Upper});
    if (Left[I].Upper.ult(Right[J].Upper))
      ++I;
    else
      ++J;
  }
  return Result;
}

MDNode *getRangeMetadata(const RangeList &Ranges, Type *Ty) {
  unsigned BitWidth = Ty->getScalarSizeInBits();
  APInt Limit = APInt::getOneBitSet(BitWidth + 1, BitWidth);
  if (Ranges.size() == 1 && Ranges.front().Lower.isZero() &&
      Ranges.front().Upper == Limit)
    return nullptr;

  // Join intervals adjacent across zero before restoring signed lower-bound
  // order, as required by the legacy metadata verifier.
  bool JoinEdges = Ranges.size() > 1 && Ranges.front().Lower.isZero() &&
                   Ranges.back().Upper == Limit;
  SmallVector<ConstantRange, 4> Circular;
  for (unsigned I = JoinEdges ? 1 : 0,
                E = Ranges.size() - (JoinEdges ? 1 : 0);
       I < E; ++I)
    Circular.emplace_back(Ranges[I].Lower.trunc(BitWidth),
                          Ranges[I].Upper.trunc(BitWidth));
  if (JoinEdges)
    Circular.emplace_back(Ranges.back().Lower.trunc(BitWidth),
                          Ranges.front().Upper.trunc(BitWidth));
  llvm::sort(Circular, [](const ConstantRange &A, const ConstantRange &B) {
    return A.getLower().slt(B.getLower());
  });

  LLVMContext &Ctx = Ty->getContext();
  SmallVector<Metadata *, 8> Bounds;
  for (const ConstantRange &Range : Circular) {
    Bounds.push_back(
        ConstantAsMetadata::get(ConstantInt::get(Ctx, Range.getLower())));
    Bounds.push_back(
        ConstantAsMetadata::get(ConstantInt::get(Ctx, Range.getUpper())));
  }
  return MDNode::get(Ctx, Bounds);
}

bool intersectReturnRanges(CallBase &CB) {
  Type *Ty = CB.getType();
  if (!Ty->isIntOrIntVectorTy())
    return false;

  auto SiteRange = getAttributeRange(
      CB.getAttributes().getRetAttrs().getAttribute(RangeCarrier), Ty);
  std::optional<ConstantRange> CalleeRange;
  if (Function *Callee = CB.getCalledFunction())
    CalleeRange = getAttributeRange(
        Callee->getAttributes().getRetAttrs().getAttribute(RangeCarrier), Ty);
  if (!SiteRange && !CalleeRange)
    return false;

  MDNode *OldMD = CB.getMetadata(LLVMContext::MD_range);
  RangeList Ranges;
  if (OldMD) {
    for (unsigned I = 0; I < OldMD->getNumOperands(); I += 2)
      appendRange(Ranges,
                  ConstantRange(mdconst::extract<ConstantInt>(OldMD->getOperand(I))
                                    ->getValue(),
                                mdconst::extract<ConstantInt>(
                                    OldMD->getOperand(I + 1))
                                    ->getValue()));
    normalizeRanges(Ranges);
  } else {
    appendRange(Ranges, ConstantRange::getFull(Ty->getScalarSizeInBits()));
  }
  if (SiteRange)
    Ranges = intersectRanges(Ranges, *SiteRange);
  if (CalleeRange)
    Ranges = intersectRanges(Ranges, *CalleeRange);

  if (Ranges.empty()) {
    // Legacy !range cannot express an empty set. Keep call effects and unwind
    // edges, but make every use of the impossible result poison.
    bool Changed = !CB.use_empty() || OldMD;
    CB.replaceAllUsesWith(PoisonValue::get(Ty));
    CB.setMetadata(LLVMContext::MD_range, nullptr);
    return Changed;
  }

  MDNode *NewMD = getRangeMetadata(Ranges, Ty);
  if (NewMD == OldMD)
    return false;
  CB.setMetadata(LLVMContext::MD_range, NewMD);
  return true;
}

AttributeList removeCarriers(AttributeList Attrs, LLVMContext &Ctx) {
  for (unsigned Index : Attrs.indexes())
    Attrs = Attrs.removeAttributeAtIndex(Ctx, Index, RangeCarrier);
  return Attrs;
}

} // namespace

PreservedAnalyses RangeAttrsToMetadataPass::run(Module &M,
                                              ModuleAnalysisManager &) {
  bool Changed = false;
  // Keep function carriers until all callers have been processed, including
  // forward declarations and recursive calls.
  for (Function &F : M) {
    for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {
        auto *CB = dyn_cast<CallBase>(&I);
        if (!CB)
          continue;
        if (isa<CallInst>(CB) || isa<InvokeInst>(CB))
          Changed |= intersectReturnRanges(*CB);

        AttributeList OldAttrs = CB->getAttributes();
        AttributeList NewAttrs = removeCarriers(OldAttrs, M.getContext());
        if (OldAttrs != NewAttrs) {
          CB->setAttributes(NewAttrs);
          Changed = true;
        }
      }
    }
  }

  for (Function &F : M) {
    AttributeList OldAttrs = F.getAttributes();
    AttributeList NewAttrs = removeCarriers(OldAttrs, M.getContext());
    if (OldAttrs != NewAttrs) {
      F.setAttributes(NewAttrs);
      Changed = true;
    }
  }

  return Changed ? PreservedAnalyses::none() : PreservedAnalyses::all();
}
