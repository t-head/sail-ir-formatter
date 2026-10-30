//===- RangeAttrsToMetadata.h - Range compatibility lowering ------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_TRANSFORMS_UTILS_RANGEATTRSTOMETADATA_H
#define LLVM_TRANSFORMS_UTILS_RANGEATTRSTOMETADATA_H

#include "llvm/IR/PassManager.h"

namespace llvm {

/// Intersect return-range carriers and existing call/invoke range metadata.
/// Empty results become poison; remove all carriers, including parameter ones.
class RangeAttrsToMetadataPass : public PassInfoMixin<RangeAttrsToMetadataPass> {
public:
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM);
};

} // namespace llvm

#endif // LLVM_TRANSFORMS_UTILS_RANGEATTRSTOMETADATA_H
