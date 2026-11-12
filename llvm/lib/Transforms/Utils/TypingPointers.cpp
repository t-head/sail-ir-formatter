//===- TypedPointers.cpp - Symbol Rewriter -------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/Analysis/ValueTracking.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalAlias.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstVisitor.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicsNVPTX.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/Constant.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/ReplaceConstant.h"
#include "llvm/IR/Use.h"
#include "llvm/InitializePasses.h"
#include "llvm/Pass.h"
#include "llvm/Support/Casting.h"
#include "llvm/Transforms/Utils.h"
#include "llvm/Support/Process.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Transforms/Utils/TypingPointers.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/SmallSet.h"
#include <map>
#include <set>

#define DEBUG_TYPE "type-pointers"

using namespace llvm;

namespace {
class PointersAnalyzer : public InstVisitor<PointersAnalyzer> {
private:
  bool Changed = false;
  std::map<Function*, bool>FunctionMap;
  std::map<Function*, Function*> FunctionRemoveMap;
  std::vector<GlobalVariable*> GlobalList;
  std::vector<GlobalAlias*> GlobalAliasList;
  std::map<GlobalVariable*, GlobalVariable*> GlobalMap;
  SmallSet<Constant*, 8> FuncConstantUser;

  // Holds metadata as intrinsic argument
  SmallSet<MDNode*, 8> MDContainer;

  std::vector<PHINode*> PHIList;
  std::map<Constant*, Constant*>ConstantExpMap;

  std::map<Value*, Value*> AggregateMap;
  std::map<Value*, std::vector<Value*>> AggregateChain;
  std::map<Value*, Value*> ReplaceValue; // <new, old> 

  //constant map, hold the global vairable and constant expression.
  //TODO: GlobalMap&ConstantMap should be Merged here
  std::map<Constant*, Constant*>ConstantMap;

  // Holds all new created values
  std::map<Value*, Value*>ValueMap;

public:
  PointersAnalyzer()=default;
  bool isChanged(){ return Changed; };

  void visitICmpInst(ICmpInst &I);
  void visitAllocaInst(AllocaInst &I);
  void visitLoadInst(LoadInst     &I);
  void visitStoreInst(StoreInst   &I);
  void visitAtomicCmpXchgInst(AtomicCmpXchgInst &I);
  void visitAtomicRMWInst(AtomicRMWInst &I);
  void visitGetElementPtrInst(GetElementPtrInst &I);
  void visitPHINode(PHINode &I);
  void visitPtrToIntInst(PtrToIntInst &I);
  void visitIntToPtrInst(IntToPtrInst &I);
  void visitBitCastInst(BitCastInst &I);
  void visitAddrSpaceCastInst(AddrSpaceCastInst &I);
  void visitSelectInst(SelectInst &I);
  //void visitVAArgInst(VAArgInst   &I);
  void visitExtractElementInst(ExtractElementInst &I);
  void visitInsertElementInst(InsertElementInst &I);
  //void visitShuffleVectorInst(ShuffleVectorInst &I);
  void visitExtractValueInst(ExtractValueInst &I);
  void visitInsertValueInst(InsertValueInst &I);

  void visitCallInst(CallInst &I);
  void visitReturnInst(ReturnInst &I);
  void visitVAArgInst(VAArgInst &I);

  //void visitLandingPadInst(LandingPadInst &I);

  void visitInstruction(Instruction &I);

  void collectAggregates(Instruction &I);

  Type* processType(Type* Ty);
  StructType* processStructType(StructType* STy);
  ArrayType* processArrayType(ArrayType* ATy);
  VectorType* processVectorType(VectorType* ATy);
  void processNVVMReflect(Module &M);
  void processFunctions(Module &M);
  void processGlobals(Module &M);
  void processGlobalAliases(Module &M);
  void processMetaData(Module &M);
  void processIdentifiedStructTypes(Module &M);
  bool processFunction(Function* &F);
  bool processFunctionArguments(Function* &F);
  void processStructure(Value* SVal, StructType* NewTy=nullptr);
  void processVector(Value* VVal, VectorType* NewTy=nullptr);
  void processArray(Value* AVal, ArrayType* NewTy=nullptr);
  void processAggregates(Module &N);
  void processAggregateAndVectorUse(Value* AggVal, Value* NewVal);
  void processPHINode(PHINode &I);
  // format the constant expression and map with the typed expressions
  void processConstantExpression(ConstantExpr *CE, GlobalVariable* OldGV=nullptr,
                                 GlobalVariable* NewGV=nullptr);
  Constant* processConstantAggregate(ConstantAggregate *CA);

  Constant* processConstant(Constant* CVal);

  GlobalVariable* processGlobalVariable(GlobalVariable* GV);

  Value* createCast(IRBuilder<> &builder, Value* SrcVal, Type* DestTy);

  Value* processOpaqueOperand(IRBuilder<> &builder, Value* SrcVal, Type* DestTy=nullptr);

  Value* processPtr(IRBuilder<> &builder, Value* SrcPtr, Type* TypedPtrTy);

  void removeRedundantBitCast(Module &M);
  void removeDeadValue();
  void removeFakeCast(Module &M);

  // Process masked intrinsics from 3-arg to 4-arg form.
  bool processMaskedIntrinsics(Module &M);

  bool runOnModule(Module &M);
};
}

PreservedAnalyses TypingPointers::run(Module &M, ModuleAnalysisManager &MAM) {
  bool MadeChange = false;
  PointersAnalyzer Analyzer;

  MadeChange = Analyzer.runOnModule(M);

  if (MadeChange)
    return PreservedAnalyses::none();
  return PreservedAnalyses::all();
}

static bool ppuReflect(GlobalVariable &GV) {
  if (!GV.hasInitializer())
    return false;
  Constant *Initializer = GV.getInitializer();
  auto *CD = dyn_cast<ConstantDataSequential>(Initializer);
  if (!CD)
    return false;
  SmallVector<Value *, 32> WorkList(GV.users());
  while (!WorkList.empty()) {
    Value *V = WorkList.pop_back_val();
    if (CallInst *CI = dyn_cast<CallInst>(V)) {
      if (CI->getCalledFunction() &&
          (CI->getCalledFunction()->getName() == "__hggc_reflect" ||
           CI->getCalledFunction()->getName() == "__nvvm_reflect"))
        return true;
      continue;
    }
    for (auto *U : V->users()) {
      if (isa<ConstantExpr>(U) || isa<CallInst>(U))
        WorkList.push_back(U);
    }
  }

  return false;
}

static void convertConstantToInstGVs(Module &M) {
  SmallVector<GlobalVariable *, 16> ConstToInsts;
  for (auto &V : M.globals()) {
    if (!ppuReflect(V)) {
      ConstToInsts.push_back(&V);
    }
  }
  SmallVector<Constant *, 8> ConvertList(ConstToInsts.begin(),
                                         ConstToInsts.end());
  convertUsersOfConstantsToInstructions(ConvertList);
}

static bool isMaskedIntrinsic(unsigned IID) {
  return IID == Intrinsic::masked_store || IID == Intrinsic::masked_load ||
         IID == Intrinsic::masked_gather || IID == Intrinsic::masked_scatter;
}

bool PointersAnalyzer::runOnModule(Module& M) {

  for(Function &F : M.functions()) {
    // Masked intrinsics need 4-arg signature for ppu-llc (LLVM 13),
    // handled separately by processMaskedIntrinsics().
    if (isMaskedIntrinsic(F.getIntrinsicID()))
      continue;
    FunctionMap[&F] = false;
  }

  processNVVMReflect(M);

  convertConstantToInstGVs(M);

  processGlobals(M);

  processAggregates(M);

  processGlobalAliases(M);

  // FIXME: Constant to instruction second, Avoid the Constant introduced when
  // handling global variables
  convertConstantToInstGVs(M);

  processFunctions(M);

  processMaskedIntrinsics(M);

  processIdentifiedStructTypes(M);

  processMetaData(M);

  removeDeadValue();

  removeFakeCast(M);

  removeRedundantBitCast(M);

  LLVM_DEBUG(llvm::dbgs() << "final module: \n";
             M.print(llvm::dbgs(), nullptr);
             llvm::dbgs() << "\n"; );

  return Changed;
}


bool static isContainOpaquePointers(Type *Ty) {
  if(Ty->getNumContainedTypes() == 0) {
    return Ty->isOpaquePointerTy();
  } else {
    for(auto SubTy : Ty->subtypes()) {
      if(isContainOpaquePointers(SubTy))
        return true;
    }
    return false;
  }
}


// Finds first non alloca instruction in the entry block of a function.
static Instruction *getFirstNonAllocaInTheEntryBlock(Function *F) {
  for (Instruction &I : F->getEntryBlock())
    if (!isa<AllocaInst>(&I))
      return &I;
  llvm_unreachable("no terminator in the entry block");
}

void PointersAnalyzer::collectAggregates(Instruction &I) {
  if(InsertValueInst * InsertI = dyn_cast<InsertValueInst>(&I)) {
    if(isa<UndefValue>(InsertI->getAggregateOperand()) ||
       isa<PoisonValue>(InsertI->getAggregateOperand())) {
      if(isContainOpaquePointers(InsertI->getType())) {
        std::vector<Value*> InsertList;
        InsertList.push_back(InsertI);
        while(InsertI->hasOneUser()) {
          if(InsertValueInst* NextInsertI = dyn_cast<InsertValueInst>(*InsertI->user_begin())) {
            InsertI = NextInsertI;
            InsertList.push_back(InsertI);
          } else {
            break;
          }
        }
        if(AggregateChain.find(InsertI) == AggregateChain.end()) {
          AggregateChain.insert(std::make_pair(InsertI, InsertList));
        }
      }
    }
  } else if (InsertElementInst * InsertI = dyn_cast<InsertElementInst>(&I)) {
    if(isa<UndefValue>(InsertI->getOperand(0)) ||
       isa<PoisonValue>(InsertI->getOperand(0))) {
      if(isContainOpaquePointers(InsertI->getType())) {
        std::vector<Value*> InsertList;
        InsertList.push_back(InsertI);
        while(InsertI->hasOneUser()) {
          if(InsertElementInst* NextInsertI = dyn_cast<InsertElementInst>(*InsertI->user_begin())) {
            InsertI = NextInsertI;
            InsertList.push_back(InsertI);
          } else {
            break;
          }
        }
        if(AggregateChain.find(InsertI) == AggregateChain.end()) {
          AggregateChain.insert(std::make_pair(InsertI, InsertList));
        }
      }
    }
  }
}

void PointersAnalyzer::processNVVMReflect(Module &M) {
  if(Function *F = M.getFunction("__nvvm_reflect")) {
    if(F->getFunctionType()->getParamType(0)->isOpaquePointerTy()) {
        processFunction(F);
    }
  }
}

static bool checkConstantContained(Constant* CT, Constant* CVal) {
  //self contained must have ptr type inside
  if(isContainOpaquePointers(CT->getType())) {
    if(CT == CVal) return true;
    if(ConstantAggregate* CA = dyn_cast<ConstantAggregate>(CT)) {
    for(unsigned Idx = 0; Idx < CA->getNumOperands(); Idx++) {
      Constant *Opnd = CA->getOperand(Idx);
      if(checkConstantContained(Opnd, CVal)) {
        return true;
      }
      }
    } else if (ConstantExpr* CE = dyn_cast<ConstantExpr>(CT)) {
    for(unsigned Idx = 0; Idx < CE->getNumOperands(); Idx++) {
      Constant *Opnd = CE->getOperand(Idx);
      if(checkConstantContained(Opnd, CVal)) {
        return true;
      }
      }
    }
  }
  return false;
}

static bool isSelfContained(GlobalVariable* GVal) {
  if(GVal->hasInitializer()){
    auto* Initializer = GVal->getInitializer();
    return checkConstantContained(Initializer, GVal);
  }
  return false;
}

GlobalVariable* PointersAnalyzer::processGlobalVariable(GlobalVariable* GV) {
  if(!GV->getType()->isOpaquePointerTy()) return GV;
  if(GlobalMap.find(GV) != GlobalMap.end()) return GlobalMap[GV];

  Module *M = GV->getParent();
  Type* ValTy = GV->getValueType();
  Type* NewTy = PointerType::get(ValTy, GV->getType()->getPointerAddressSpace(), true);
  if(ValTy->isOpaquePointerTy()) {
    NewTy = PointerType::get(Type::getInt8Ty(M->getContext()),
                    GV->getType()->getPointerAddressSpace(), true);
  }
  LLVM_DEBUG(llvm::dbgs() << "global new type: \n";
              NewTy->print(llvm::dbgs());
              llvm::dbgs() << "\n"; );
  //Copy Global
  Constant *Initializer = nullptr;
  auto* ValueType = GV->getValueType();
  if(GV->hasInitializer()) {
    Initializer = GV->getInitializer();
    if(isContainOpaquePointers(Initializer->getType())) {
      Initializer = processConstant(Initializer);
    }
    ValueType = Initializer->getType();
  }
  GlobalVariable *NewGV = new GlobalVariable(*M, ValueType, GV->isConstant(),
                            GV->getLinkage(), Initializer, true, GV->getName(),
                            nullptr, GV->getThreadLocalMode(), GV->getType()->getAddressSpace());
  NewGV->copyAttributesFrom(GV);
  NewGV->takeName(GV);
  //NewGV->getComdat(GV->getComdat());

  LLVM_DEBUG(llvm::dbgs() << "Create new global: \n";
              NewGV->print(llvm::dbgs());
              llvm::dbgs() << "\n"; );
  GlobalMap[GV] = NewGV;

  Value::user_iterator Next;
  for(Value::user_iterator UserI = GV->user_begin(), UserE = GV->user_end();
                        UserI != UserE; UserI = Next) {
    Next = std::next(UserI);
    LLVM_DEBUG(llvm::dbgs() << "find use: \n";
              UserI->print(llvm::dbgs());
              llvm::dbgs() << "\n"; );
    if(Instruction* I = dyn_cast<Instruction>(*UserI)) {
      //global variable used in common instructions
      IRBuilder<> B(I);
      auto *NewCast = B.CreateBitCast(NewGV, GV->getType());
      UserI->replaceUsesOfWith(GV, NewCast);
    } else if (Constant* CVal = dyn_cast<Constant>(*UserI)){
      //global variable used in constant expressions/constant aggregate
      Constant *NewCVal = processConstant(CVal);
      if(auto* CA = dyn_cast<ConstantAggregate>(CVal)) {
        //skip
      } else if (ConstantExpr* CE = dyn_cast<ConstantExpr>(*UserI)) {
        Constant *NewCast = ConstantExpr::getBitCast(NewCVal, CE->getType());
        UserI->replaceAllUsesWith(NewCast);
      } else {
        Value *NewCast = ConstantExpr::getBitCast(NewCVal, CVal->getType());
        UserI->replaceAllUsesWith(NewCast);
      }
    } else {
      report_fatal_error("Unresolved global variable use");
    }
  }
  return NewGV;
}

void PointersAnalyzer::processIdentifiedStructTypes(Module &M) {
  for (auto &STy : M.getIdentifiedStructTypes()) {
    StructType *NewSTy = cast<StructType>(processType(STy));
    LLVM_DEBUG(llvm::dbgs() << "dump type: "; STy->print(llvm::dbgs());
               llvm::dbgs() << "\n"; llvm::dbgs() << "\tnew type: ";
               NewSTy->print(llvm::dbgs()); llvm::dbgs() << "\n";);
    if(NewSTy != STy)
      STy->setBody(NewSTy->subtypes());
  }
}

void PointersAnalyzer::processGlobals(Module &M) {
  for(auto &V : M.globals()) {
    GlobalList.push_back(&V);
    //GlobalMap.insert(std::make_pair(&V, &V));
  }

  for(GlobalVariable *GV : GlobalList) {
    if(GlobalMap.find(GV) != GlobalMap.end()) continue;
    if(GV->getType()->isOpaquePointerTy()) {
      Type* ValTy = GV->getValueType();
      Type* NewTy = PointerType::get(ValTy, GV->getType()->getPointerAddressSpace(), true);
      if(ValTy->isOpaquePointerTy()) {
        NewTy = PointerType::get(Type::getInt8Ty(M.getContext()),
                        GV->getType()->getPointerAddressSpace(), true);
      }
      LLVM_DEBUG(llvm::dbgs() << "global new type: \n";
                 NewTy->print(llvm::dbgs());
                 llvm::dbgs() << "\n"; );
      //Copy Global
      Constant *Initializer = nullptr;
      bool ReserveType = true;
      auto* ValueType = GV->getValueType();
      if(GV->hasInitializer()) {
        Initializer = GV->getInitializer();
        if(isContainOpaquePointers(Initializer->getType())) {
          Initializer = processConstant(Initializer);
        }
        ValueType = Initializer->getType();
      }
      if (ValTy->isPointerTy() && !GV->hasInitializer())
        ReserveType = false;
      GlobalVariable *NewGV = new GlobalVariable(
            M, ValueType, GV->isConstant(), GV->getLinkage(), Initializer,
            ReserveType, "", GV, GV->getThreadLocalMode(),
            GV->getType()->getAddressSpace(), GV->isExternallyInitialized());
      NewGV->copyAttributesFrom(GV);
      NewGV->takeName(GV);
      NewGV->copyMetadata(GV, 0);
      //NewGV->getComdat(GV->getComdat());

      LLVM_DEBUG(llvm::dbgs() << "Create new global: \n";
                 NewGV->print(llvm::dbgs());
                 llvm::dbgs() << "\n"; );
      GlobalMap[GV] = NewGV;

      Value::user_iterator Next;
      for(Value::user_iterator UserI = GV->user_begin(), UserE = GV->user_end();
                            UserI != UserE; UserI = Next) {
        Next = std::next(UserI);
        LLVM_DEBUG(llvm::dbgs() << "find use: \n";
                  UserI->print(llvm::dbgs());
                  llvm::dbgs() << "\n"; );
        if(Instruction* I = dyn_cast<Instruction>(*UserI)) {
          //global variable used in common instructions
          IRBuilder<> B(I);
          auto *NewCast = B.CreateBitCast(NewGV, GV->getType());
          UserI->replaceUsesOfWith(GV, NewCast);
        } else if (GlobalVariable* RGV = dyn_cast<GlobalVariable>(*UserI)) {
          if(GlobalMap.find(RGV) == GlobalMap.end()) {
            GlobalVariable *NewRGV = new GlobalVariable(M, NewGV->getType(), RGV->isConstant(),
                                RGV->getLinkage(), NewGV, true, "",
                                RGV, RGV->getThreadLocalMode(), RGV->getType()->getAddressSpace(),
                                RGV->isExternallyInitialized());
            NewRGV->copyAttributesFrom(RGV);
            NewRGV->takeName(RGV);
            GlobalMap[RGV] = NewRGV;
            //UserI->replaceAllUsesWith(NewRGV);
          }
        } else if (Constant* CVal = dyn_cast<Constant>(*UserI)){
          //global variable used in constant expressions/constant aggregate
          Constant *NewCVal = processConstant(CVal);
          if(auto* CA = dyn_cast<ConstantAggregate>(CVal)) {
            //skip
          } else if (ConstantExpr* CE = dyn_cast<ConstantExpr>(*UserI)) {
            Constant *NewCast = ConstantExpr::getBitCast(NewCVal, CE->getType());
            UserI->replaceAllUsesWith(NewCast);
          } else {
            Value *NewCast = ConstantExpr::getBitCast(NewCVal, CVal->getType());
            UserI->replaceAllUsesWith(NewCast);
          }
        } else {
          report_fatal_error("Unresolved global variable use");
        }
      }
    }
  }
}

void PointersAnalyzer::processGlobalAliases(Module &M) {
  for (auto &A : M.aliases()) {
    GlobalAliasList.push_back(&A);
  }

  for (GlobalAlias *GA : GlobalAliasList) {
    Constant *CA = GA->getAliasee();
    Constant *NewCA = processConstant(CA);
    Type *NewTy = NewCA->getType();
    if (auto *ptrType = dyn_cast<PointerType>(NewCA->getType())) {
      NewTy = ptrType->getNonOpaquePointerElementType();
    }

    if (CA != NewCA) {
      LLVM_DEBUG(llvm::dbgs() << "processing global aliase: \n";
                 GA->print(llvm::dbgs());
                 llvm::dbgs() << "\n\tglobal aliase new type: \n";
                 NewTy->print(llvm::dbgs()); llvm::dbgs() << "\n";);
      GlobalAlias *NewGA =
          GlobalAlias::create(NewTy, GA->getType()->getAddressSpace(),
                              GA->getLinkage(), "", NewCA, &M);
      NewGA->takeName(GA);
      NewGA->copyAttributesFrom(GA);
      GA->replaceAllUsesWith(NewGA);
      GA->eraseFromParent();
    }
  }
}

void PointersAnalyzer::processAggregates(Module& M) {
  for(Function &F : M.functions()) {
    for (BasicBlock &BB : F) {
      for(Instruction &I : BB) {
        if(InsertValueInst *InsertI = dyn_cast<InsertValueInst>(&I)) {
          collectAggregates(*InsertI);
        } else if (InsertElementInst *InsertI = dyn_cast<InsertElementInst>(&I)) {
          collectAggregates(*InsertI);
        } else if(PHINode * PHI = dyn_cast<PHINode>(&I)) {
          if(isContainOpaquePointers(PHI->getType())) {
            PHIList.push_back(PHI);
          }
        }
      }
    }
  }
  for(auto AIter : AggregateChain) {
    if(AggregateMap.find(AIter.first) == AggregateMap.end()) {
      if(auto * InsertI = dyn_cast<InsertValueInst>(AIter.first)) {
        processStructure(AIter.first);
      } else if (auto * InsertI = dyn_cast<InsertElementInst>(AIter.first)) {
        processVector(AIter.first);
      }
    }
  }

  for (auto *PHI : PHIList) {
    processPHINode(*PHI);
  }
}

Value* PointersAnalyzer::processPtr(IRBuilder<> &builder, Value* SrcPtr, Type* TypedPtrTy) {
  Value *TypedSrc;
  //AggregateType includes struct and array types, but does not include vector types
  if(SrcPtr->getType()->isAggregateType()) {
    TypedSrc = builder.CreateIntrinsic(Intrinsic::fake_cast,
                      {TypedPtrTy, SrcPtr->getType()}, {SrcPtr});
  } else if(ConstantExpr *CE = dyn_cast<ConstantExpr>(SrcPtr)) {
    if(ConstantExpMap.find(CE) == ConstantExpMap.end()) {
      processConstantExpression(CE);
    }
    Value* NewSrcOpnd = ConstantExpMap[CE];
    if(TypedPtrTy != NewSrcOpnd->getType())
      TypedSrc = builder.CreateBitCast(NewSrcOpnd, TypedPtrTy);
    else
      TypedSrc = NewSrcOpnd;
  } else {
    TypedSrc = builder.CreateBitCast(SrcPtr, TypedPtrTy);
  }
  return TypedSrc;
}

void PointersAnalyzer::processConstantExpression(ConstantExpr *CE,
                                            GlobalVariable* OldGV,
                                            GlobalVariable* NewGV){
  if(ConstantExpMap.find(CE) != ConstantExpMap.end()) return;

  if (auto *GEP = dyn_cast<GEPOperator>(CE)) {
    // The new return type will be source element pointer type
    auto SETy = GEP->getSourceElementType();
    SETy = processType(SETy);
    auto SEPtrTy = PointerType::get(SETy, GEP->getPointerAddressSpace(), true);
    std::vector<Value*> Idx;
    for(auto It = GEP->idx_begin(); It != GEP->idx_end(); It++) {
      Idx.push_back(*It);
    }

    Constant *SrcPtr = dyn_cast<Constant>(GEP->getPointerOperand());
    if (GlobalVariable* SrcGV = dyn_cast<GlobalVariable>(SrcPtr)) {
      if(GlobalMap.find(SrcGV) != GlobalMap.end()) {
        SrcPtr = GlobalMap[SrcGV];
      }
    }

    if(SEPtrTy == SrcPtr->getType()) {
      //create new GEP constant expression
      // New GEP returns typed pointer
      Constant *NewGEP =
            ConstantExpr::getInBoundsGetElementPtr(SETy, SrcPtr, Idx, true, true);
      ConstantExpMap[CE] = NewGEP;
    } else {
      //create bitcast and new GEP constant expression
      Constant *PreCast = ConstantExpr::getBitCast(SrcPtr, SEPtrTy);
      Constant *NewGEP =
            ConstantExpr::getInBoundsGetElementPtr(SETy, PreCast, Idx, true, true);
      ConstantExpMap[CE] = NewGEP;
    }
  } else if(auto * BC = dyn_cast<BitCastOperator>(CE)) {
    Constant *SrcOpnd = dyn_cast<Constant>(BC->getOperand(0));
    Constant *NewSrcOpnd;
    if(BC->getType()->isOpaquePointerTy()){
      //cast will be fold.
      NewSrcOpnd = processConstant(SrcOpnd);
      if(NewSrcOpnd->getType()->isOpaquePointerTy()) {
        Type* Int8Ptr = PointerType::get(Type::getInt8Ty(CE->getContext()),
                                  BC->getType()->getPointerAddressSpace(), true);
        auto* NewCast = ConstantExpr::getBitCast(NewSrcOpnd, Int8Ptr);
        ConstantExpMap[CE] = NewCast;
      } else {
        ConstantExpMap[CE] = NewSrcOpnd;
      }
    } else {
      NewSrcOpnd = processConstant(SrcOpnd);
      if(NewSrcOpnd == SrcOpnd) {
        ConstantExpMap[CE] = CE;
      } else {
        ConstantExpMap[CE] = ConstantExpr::getBitCast(NewSrcOpnd, BC->getType());
      }
    }
  } else if(auto *AC = dyn_cast<AddrSpaceCastOperator>(CE)) {
    Constant* SrcOpnd = dyn_cast<Constant>(AC->getPointerOperand());
    Constant* NewSrcOpnd = processConstant(SrcOpnd);
    // cast to Int8*, in case that getAddrSpaceCast auto cast to ptr
    Type* Int8Ptr = PointerType::get(Type::getInt8Ty(CE->getContext()),
                                  SrcOpnd->getType()->getPointerAddressSpace(), true);
    Type* DstPtrTy = PointerType::get(Type::getInt8Ty(CE->getContext()),
                                  AC->getDestAddressSpace(), true);
    Type* NewSrcTy = NewSrcOpnd->getType();
    if(NewSrcTy != Int8Ptr)
      NewSrcOpnd = ConstantExpr::getBitCast(NewSrcOpnd, Int8Ptr);

    Constant *NewAC = ConstantExpr::getAddrSpaceCast(NewSrcOpnd, DstPtrTy);
    ConstantExpMap[CE] = NewAC;

  } else if(auto * PTI= dyn_cast<PtrToIntOperator>(CE)) {
    //report_fatal_error("PtrToIntOperator ConstantExpr type need to be handle");
    IRBuilder<> B(CE->getContext());
    Value* Opnd = PTI->getPointerOperand();
    Value* NewOpnd = processOpaqueOperand(B, Opnd);
    Constant *NewPTI = ConstantExpr::getPtrToInt(dyn_cast<Constant>(NewOpnd), PTI->getType());
    ConstantExpMap[CE] = NewPTI;
  } else if (CE->getOpcode() == Instruction::IntToPtr) {
    auto *ITP = dyn_cast<IntToPtrInst>(CE->getAsInstruction());
    // visitIntToPtrInst(*ITP);
    IRBuilder<> B(CE->getContext());
    Type *PtrType = ITP->getDestTy();
    Type *NewPtrType = processType(PtrType);
    Constant *NewITP = CE;
    if (PtrType != NewPtrType)
      NewITP = ConstantExpr::getIntToPtr(dyn_cast<Constant>(ITP->getOperand(0)),
                                         NewPtrType);
    ConstantExpMap[CE] = NewITP;
  } else {
    ConstantExpMap[CE] = CE;
    //report_fatal_error("Unknown ConstantExpr type need to be handle");
  }

}


void PointersAnalyzer::processArray(Value* AVal, ArrayType* NewTy) {
  LLVMContext &Ctx = AVal->getContext();
  ArrayType * ATy = dyn_cast<ArrayType>(AVal->getType());
  if(NewTy == nullptr) {
    NewTy = dyn_cast<ArrayType>(processType(ATy));
  }
  if(ConstantArray *CAY = dyn_cast<ConstantArray>(AVal)) {
    auto *ETy = CAY->getType()->getElementType();
    IRBuilder<> B(Ctx);
    if(isContainOpaquePointers(ETy)) {
      SmallVector<Constant *, 8> Opnds;
      for(unsigned Idx = 0; Idx < CAY->getNumOperands(); Idx++) {
        auto* NewOpnd = processConstant(CAY->getOperand(Idx));
        // for cases that function type should be cast to i8* for fitting different function types
        if(NewOpnd->getType() != NewTy->getElementType()) {
          NewOpnd = dyn_cast<Constant>(createCast(B, NewOpnd, NewTy->getElementType()));
        }
        Opnds.push_back(NewOpnd);
      }
      auto* NewArray = ConstantArray::get(NewTy, Opnds);
      AggregateMap.insert(std::make_pair(AVal, NewArray));
    }
  } else {
    report_fatal_error("Need to implement array");
  }
}

// all the constant should be handled carefully in case that missing
// i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)
Constant* PointersAnalyzer::processConstant(Constant* CVal) {
  LLVMContext &Ctx = CVal->getContext();
  IRBuilder<> B(Ctx);

  if(auto *CAY = dyn_cast<ConstantArray>(CVal)) {
    processArray(CAY);
    return dyn_cast<Constant>(AggregateMap[CAY]);
  } else if (auto *CST = dyn_cast<ConstantStruct>(CVal)) {
    processStructure(CST);
    return dyn_cast<Constant>(AggregateMap[CST]);
  } else if(auto* Func = dyn_cast<Function>(CVal)) {
    if(FunctionRemoveMap.find(Func) != FunctionRemoveMap.end()) {
      Func = FunctionRemoveMap[Func];
    } else {
      processFunction(Func);
    }
    return Func;
  } else if(ConstantExpr *CE = dyn_cast<ConstantExpr>(CVal)) {
    if(ConstantExpMap.find(CE) == ConstantExpMap.end()) {
      processConstantExpression(CE);
    }
    return ConstantExpMap[CE];
  } else if (ConstantAggregateZero *CZ = dyn_cast<ConstantAggregateZero>(CVal)) {
    Type* NewTy = processType(CZ->getType());
    return ConstantAggregateZero::get(NewTy);
  } else if (UndefValue *UDef = dyn_cast<UndefValue>(CVal)) {
    Type* NewTy = processType(UDef->getType());
    return UndefValue::get(NewTy);
  } else if (GlobalVariable* GV = dyn_cast<GlobalVariable>(CVal)) {
    if (GlobalMap.find(GV) != GlobalMap.end()) {
      return GlobalMap[GV];
    } else {
      Type* I8Ptr = PointerType::get(Type::getInt8Ty(Ctx),
                                    CVal->getType()->getPointerAddressSpace(), true);
      return ConstantExpr::getBitCast(CVal, I8Ptr);
    }
  } else if (isContainOpaquePointers(CVal->getType())) {
    Type* I8Ptr = PointerType::get(Type::getInt8Ty(Ctx),
                                  CVal->getType()->getPointerAddressSpace(), true);
    return ConstantExpr::getBitCast(CVal, I8Ptr);
  } else {
    return CVal;
  }
}

Constant* PointersAnalyzer::processConstantAggregate(ConstantAggregate *CAG) {
  LLVMContext &Ctx = CAG->getContext();
  if(auto *CAY = dyn_cast<ConstantArray>(CAG)) {
    processArray(CAY);
    return dyn_cast<Constant>(AggregateMap[CAY]);
  } else if (auto *CST = dyn_cast<ConstantStruct>(CAG)) {
    processStructure(CST);
    return dyn_cast<Constant>(AggregateMap[CST]);
  }
  return CAG;
}

void PointersAnalyzer::processVector(Value* VVal, VectorType* NewTy) {
  LLVMContext &Ctx = VVal->getContext();
  VectorType * VTy = dyn_cast<VectorType>(VVal->getType());
  if(NewTy == nullptr) {
    NewTy = dyn_cast<VectorType>(processType(VTy));
  }
  if(ConstantVector *CVector = dyn_cast<ConstantVector>(VVal)) {
    report_fatal_error("Need to implement constant vector");
  } else {
    Value* NewAgg = llvm::PoisonValue::get(NewTy);
    for(Value* InsertVal : AggregateChain[VVal]) {
      IRBuilder<> B(dyn_cast<Instruction>(InsertVal));
      InsertElementInst *InsertI = dyn_cast<InsertElementInst>(InsertVal);
      Value *IstValue = InsertI->getOperand(1);
      Value *Index = InsertI->getOperand(2);
      if(IstValue->getType()->isAggregateType()) {
        report_fatal_error("unhandled aggregate elements in vector");
      } else {
        IstValue = processPtr(B, IstValue, NewTy->getElementType());
      }
      NewAgg = B.CreateInsertElement(NewAgg, IstValue, Index);
    }
    AggregateMap.insert(std::make_pair(VVal, NewAgg));

    Value::user_iterator Next;
    bool OtherUse = false;
    for(Value::user_iterator UserI = VVal->user_begin(), UserE = VVal->user_end();
                          UserI != UserE; UserI = Next) {
      Next = std::next(UserI);
      IRBuilder<> B(dyn_cast<Instruction>(*UserI));
      if(ExtractElementInst* ExtractI = dyn_cast<ExtractElementInst>(*UserI)) {
        Value *NewExtract = B.CreateExtractElement(NewAgg, ExtractI->getIndexOperand());
        if(NewExtract->getType() != ExtractI->getType()) {
          NewExtract = processPtr(B, NewExtract, ExtractI->getType());
        }
        ExtractI->replaceAllUsesWith(NewExtract);
        ExtractI->eraseFromParent();
      } else if (PtrToIntInst* PtrCast = dyn_cast<PtrToIntInst>(*UserI)) {
        auto *NewCast = B.CreatePtrToInt(NewAgg, PtrCast->getType());
        PtrCast->replaceAllUsesWith(NewCast);
        PtrCast->eraseFromParent();
      } else if (SelectInst* SelectI = dyn_cast<SelectInst>(*UserI)) {
        Value* OriginTrue = SelectI->getTrueValue();
        Value* OriginFalse = SelectI->getFalseValue();
        if (ReplaceValue.find(OriginFalse) != ReplaceValue.end())
          OriginFalse = ReplaceValue[OriginFalse];
        if (ReplaceValue.find(OriginTrue) != ReplaceValue.end())
          OriginTrue = ReplaceValue[OriginTrue];
        if (AggregateMap.find(OriginTrue) != AggregateMap.end() &&
            AggregateMap.find(OriginFalse) != AggregateMap.end()) {
          auto *NewSelct =
              B.CreateSelect(SelectI->getCondition(), AggregateMap[OriginTrue],
                             AggregateMap[OriginFalse]);
          NewSelct = processPtr(B, NewSelct, SelectI->getType());
          SelectI->replaceAllUsesWith(NewSelct);
          SelectI->eraseFromParent();
        }
      } else {
        OtherUse = true;
      }
    }
    if(OtherUse) {
      IRBuilder<> B(dyn_cast<Instruction>(VVal));
      Value *NewVal = processPtr(B, NewAgg, VVal->getType());
      VVal->replaceAllUsesWith(NewVal);
      ReplaceValue.insert({NewVal, VVal});
    }
  }
}


static bool isSameType(Type* A, Type* B) {
  if(A == B) return true;
  // A!=B
  // none-aggregate/none-pointer type
  if (A->getNumContainedTypes() == 0) return false;
  //different typeID
  if (A->getTypeID() != B->getTypeID()) return false;
  //different subtype
  if (A->getNumContainedTypes() != B->getNumContainedTypes())
    return false;

  for(auto Idx = 0; Idx < A->getNumContainedTypes(); Idx++) {
    if(!isSameType(A->getContainedType(Idx), B->getContainedType(Idx)))
    return false;
  }
  return true;

}


// isContainOpaquePointers can't decide if there is opaque pointers
// becase constant expression like i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)
// can be anywhere
void PointersAnalyzer::processStructure(Value* SVal, StructType* NewTy) {
  LLVMContext &Ctx = SVal->getContext();
  StructType * STy = dyn_cast<StructType>(SVal->getType());
  if(NewTy == nullptr) {
    NewTy = dyn_cast<StructType>(processType(STy));
  }
  if(ConstantStruct *CStruct = dyn_cast<ConstantStruct>(SVal)) {
    //Create a new constantStructure and insert in the structure map
    IRBuilder<> B(Ctx);
    std::vector<Constant*> OpndList;
    for(unsigned Idx = 0; Idx < CStruct->getNumOperands(); Idx++) {
      Constant *Opnd = CStruct->getOperand(Idx);
      //all the constant should be handled in case that missing below:
      //i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64)
      Constant *NewOpnd = processConstant(Opnd);
      // for cases that function type should be cast to i8* for fitting different function types
      //if(NewOpnd->getType() != NewTy->getElementType(Idx)) {
      if(!isSameType(NewOpnd->getType(), NewTy->getElementType(Idx))) {
        NewOpnd = dyn_cast<Constant>(createCast(B, NewOpnd, NewTy->getElementType(Idx)));
      }
      OpndList.push_back(NewOpnd);
    }
    Constant *NewCStruct = ConstantStruct::get(NewTy, OpndList);
    AggregateMap.insert(std::make_pair(CStruct, NewCStruct));
  } else if (AggregateChain.find(SVal) != AggregateChain.end()) {
    Value* NewAgg = llvm::PoisonValue::get(NewTy);
    for(Value* InsertVal : AggregateChain[SVal]) {
      InsertValueInst *InsertI = dyn_cast<InsertValueInst>(InsertVal);
      IRBuilder<> B(dyn_cast<Instruction>(InsertVal));
      auto Indices = InsertI->getIndices();
      Value *IstValue = InsertI->getInsertedValueOperand();
      if(STy->getElementType(Indices[0]) != NewTy->getElementType(Indices[0])) {
        IstValue = processPtr(B, IstValue, NewTy->getElementType(Indices[0]));
      }
      NewAgg = B.CreateInsertValue(NewAgg, IstValue, Indices);
    }
    AggregateMap.insert(std::make_pair(SVal, NewAgg));
    Value::user_iterator Next;
    bool OtherUse = false;
    for(Value::user_iterator UserI = SVal->user_begin(), UserE = SVal->user_end();
                          UserI != UserE; UserI = Next) {
      Next = std::next(UserI);
      IRBuilder<> B(dyn_cast<Instruction>(*UserI));
      if(ExtractValueInst* ExtractI = dyn_cast<ExtractValueInst>(*UserI)) {
        Value *NewExtract = B.CreateExtractValue(NewAgg, ExtractI->getIndices());
        if(NewExtract->getType() != ExtractI->getType()) {
          NewExtract = processPtr(B, NewExtract, ExtractI->getType());
        }
        ExtractI->replaceAllUsesWith(NewExtract);
        ExtractI->eraseFromParent();
      } else {
        OtherUse = true;
      }
    }
    if(OtherUse) {
      IRBuilder<> B(dyn_cast<Instruction>(SVal));
      Value *NewVal = processPtr(B, NewAgg, SVal->getType());
      SVal->replaceAllUsesWith(NewVal);
    }
  }
}



void PointersAnalyzer::removeDeadValue() {
  for(auto SIter : AggregateMap) {
    auto SVal = SIter.first;
    // structure has inserting instruction chain
    if(AggregateChain.find(SVal) != AggregateChain.end()) {
      auto SChain = AggregateChain[SVal];
      for(unsigned Idx = SChain.size()-1; Idx != -1U; Idx--) {
        Instruction *IsrtVal = dyn_cast<Instruction>(SChain[Idx]);
        if(IsrtVal->user_empty()) {
          IsrtVal->eraseFromParent();
        } else {
          Value::user_iterator Next;
          for(Value::user_iterator UserI = IsrtVal->user_begin(), UserE = IsrtVal->user_end();
                            UserI != UserE; UserI = Next) {
            Next = std::next(UserI);
            UserI->print(llvm::errs());
            llvm::errs() << "\n";
          }
          report_fatal_error("Unresolved structure chain value");
        }
      }
    } else {
      if(SVal->user_empty()) {
        if(Constant * CSVal = dyn_cast<Constant>(SVal)) {
          CSVal->destroyConstant();
        } else {
          report_fatal_error("Unresolved strutrue type");
        }
      } else {
        // might be used in some GV
        // example: @take_self_address = linkonce global { i32, ptr } { i32 0, ptr @take_self_address }
        //report_fatal_error("Unresolved structure use");
      }
    }
  }

  // reverse first, then inorder, do delete twice
  std::vector<GlobalVariable*>RemoveList;
  for(auto RIter = GlobalList.rbegin(); RIter != GlobalList.rend(); RIter++) {
  //for(auto GV : GlobalList) {
    GlobalVariable* GV = *RIter;
    GV->removeDeadConstantUsers();
    //currently the reflect constant string still use mutatetype
    if(GV->getType()->isOpaquePointerTy()) {
      if(GV->user_empty()) {
        GV->eraseFromParent();
      } else {
        //check self contained
        if(GV->hasInitializer()){
          auto* Initializer = GV->getInitializer();
          bool isErase = true;
          Value::user_iterator Next;
          for(Value::user_iterator UserI = GV->user_begin(), UserE = GV->user_end();
                                UserI != UserE; UserI = Next) {
            Next = std::next(UserI);
            if(!checkConstantContained(Initializer, dyn_cast<Constant>(*UserI))) {
              RemoveList.push_back(dyn_cast<GlobalVariable>(GV));
              isErase = false;
              break;
            }
          }
          if(isErase)
            GV->eraseFromParent();
        } else {
          report_fatal_error("Unresolved Global Vairable");
        }
      }
    }
  }
  for(auto RIter = RemoveList.rbegin(); RIter != RemoveList.rend(); RIter++) {
    GlobalVariable* GV = *RIter;
    if(GV->getType()->isOpaquePointerTy()) {
      if(GV->user_empty()) {
        GV->eraseFromParent();
      } else {
        report_fatal_error("Unresolved Global Vairable");
      }
    }
  }

  for(auto FIter : FunctionRemoveMap) {
    auto FVal = FIter.first;
    FVal->removeDeadConstantUsers();
    if(FVal->user_empty()) {
      FVal->eraseFromParent();
    } else {
      report_fatal_error("Unresolved Function use");
    }
  }

}


void PointersAnalyzer::visitICmpInst(ICmpInst &I) {
  Value *LHS = I.getOperand(0);
  Value *RHS = I.getOperand(1);
  if(LHS->getType()->isOpaquePointerTy()) {
    IRBuilder<> B(&I);
    auto NewLHSTy = PointerType::get(B.getInt8Ty(), LHS->getType()->getPointerAddressSpace(), true);
    Value *NewLHS = B.CreateBitCast(LHS, NewLHSTy);
    auto NewRHSTy = PointerType::get(B.getInt8Ty(), RHS->getType()->getPointerAddressSpace(), true);
    Value *NewRHS = B.CreateBitCast(RHS, NewRHSTy);
    Value *NewCmp = B.CreateICmp(I.getPredicate(), NewLHS, NewRHS);
    I.replaceAllUsesWith(NewCmp);
    I.eraseFromParent();
  }
}

void PointersAnalyzer::visitAllocaInst(AllocaInst &I) {
  if(isContainOpaquePointers(I.getAllocatedType())) {
    LLVMContext &Ctx = I.getContext();
    IRBuilder<> B(&I);
    Type* AllocTy = I.getAllocatedType();
    Type* NewTy = processType(AllocTy);
    Type *RetTy = PointerType::get(NewTy, I.getAddressSpace(), true);
    Value *NewAlloc = B.CreateAlloca(NewTy, I.getAddressSpace(), I.getArraySize());
    NewAlloc->mutateType(RetTy);
    Value* TransTemp = processPtr(B, NewAlloc, I.getType());
    I.replaceAllUsesWith(TransTemp);
    I.eraseFromParent();
  } else if(I.getType()->isOpaquePointerTy()) {
    Type *DataTy = I.getAllocatedType();
    Type *DataPtrTy = PointerType::get(DataTy, I.getAddressSpace(), true);
    IRBuilder<> B(&I);
    Value *NewAlloc = B.CreateAlloca(I.getAllocatedType(), I.getAddressSpace(), I.getArraySize());
    NewAlloc->mutateType(DataPtrTy);
    Value *TransTemp = B.CreateBitCast(NewAlloc, I.getType());
    I.replaceAllUsesWith(TransTemp);
    I.eraseFromParent();
  }
}

// The point to ptr should not be happended in the really opaque pointer IR
// Point to ptr only happend in llvm13 bc test

static Type* processPointerType(Type *OpndTy, Type *TypedPtrTy, unsigned AddressSpace) {
  if(!OpndTy->isPointerTy()) return nullptr;

  if(OpndTy->isOpaquePointerTy()) {
    return TypedPtrTy;
  } else {
    Type * OpndElemTy = OpndTy->getNonOpaquePointerElementType();
    Type * NewElemTy = processPointerType(OpndElemTy, TypedPtrTy, AddressSpace);
    if(NewElemTy == nullptr) return nullptr;
    return PointerType::get(NewElemTy, AddressSpace, true);
  }

}

static Value* processOperand(IRBuilder<> &B, Value *Opnd, Type *TypedPtrTy) {
  if(!Opnd->getType()->isPointerTy()) return nullptr;
  PointerType * OpndTy = dyn_cast<PointerType>(Opnd->getType());
  if(TypedPtrTy == nullptr) {
    TypedPtrTy = PointerType::get(B.getInt8Ty(), Opnd->getType()->getPointerAddressSpace(), true);
  }
  Type *NewPtrTy = processPointerType(OpndTy, TypedPtrTy, Opnd->getType()->getPointerAddressSpace());
  if(NewPtrTy != nullptr) {
    Value *TypedSrc = B.CreateBitCast(Opnd, NewPtrTy);
    return TypedSrc;
  } else {
    return nullptr;
  }
}

void PointersAnalyzer::visitLoadInst(LoadInst &I) {
  IRBuilder<> B(&I);
  Type* ValTy = processType(I.getType());
  Value* Opnd = I.getPointerOperand();
  Value* NewOpnd = processOpaqueOperand(B, Opnd);
  if(NewOpnd != Opnd) {
    Type *NewPtrTy = PointerType::get(ValTy, Opnd->getType()->getPointerAddressSpace(), true);
    if(NewPtrTy != NewOpnd->getType()) {
      NewOpnd = createCast(B, NewOpnd, NewPtrTy);
    }
    LoadInst *NewLoad = B.CreateLoad(ValTy, NewOpnd, I.isVolatile());

    NewLoad->copyMetadata(I, {LLVMContext::MD_range});
    NewLoad->setAlignment(I.getAlign());
    NewLoad->setAtomic(I.getOrdering(), I.getSyncScopeID());

    if(I.getType() != ValTy) {
      Value* PostCast = createCast(B, NewLoad, I.getType());
      I.replaceAllUsesWith(PostCast);
    } else {
      I.replaceAllUsesWith(NewLoad);
    }

    I.eraseFromParent();
  }

}

Value* PointersAnalyzer::createCast(IRBuilder<> &builder, Value* SrcVal, Type* DestTy) {
  Type* SrcTy = SrcVal->getType();
  Value* DestVal;
  if(SrcTy->isAggregateType()) {
    DestVal = builder.CreateIntrinsic(Intrinsic::fake_cast,
                      {DestTy, SrcTy}, {SrcVal});
  } else {
    DestVal = builder.CreateBitCast(SrcVal, DestTy);
  }
  return DestVal;
}


Value* PointersAnalyzer::processOpaqueOperand(IRBuilder<> &builder, Value* SrcVal, Type* DestTy) {
  Type* SrcTy = SrcVal->getType();

  if(DestTy == nullptr) {
    DestTy = processType(SrcTy);
  }

  Value* DestVal;
  if(Constant* CVal = dyn_cast<Constant>(SrcVal)) {
    DestVal = processConstant(CVal);
    if(DestVal->getType() != DestTy) {
      DestVal = createCast(builder, DestVal, DestTy);
    }
    return DestVal;
  } else if(isContainOpaquePointers(SrcTy)) {
    DestVal = createCast(builder, SrcVal, DestTy);
    return DestVal;
  } else if (MetadataAsValue *MAV = dyn_cast<MetadataAsValue>(SrcVal)) {
    if (auto MD = dyn_cast<MDNode>(MAV->getMetadata()))
      MDContainer.insert(MD);
    return SrcVal;
  } else {
    return SrcVal;
  }
}


void PointersAnalyzer::visitStoreInst(StoreInst &I) {
  IRBuilder<>B(&I);
  Value* STVal = I.getValueOperand();
  Value *STPtr = I.getPointerOperand();

  Value* NewSTVal = processOpaqueOperand(B, STVal);
  Type *NewValPtrTy = PointerType::get(NewSTVal->getType(), STPtr->getType()->getPointerAddressSpace(), true);
  Value* NewSTPtr = processOpaqueOperand(B, STPtr);

  if(NewSTPtr != STPtr || NewSTVal != STVal) {
    if(NewValPtrTy != NewSTPtr->getType()) {
      NewSTPtr = createCast(B, NewSTPtr, NewValPtrTy);
    }
    StoreInst *NewStore = B.CreateStore(NewSTVal, NewSTPtr, I.isVolatile());
    NewStore->setAlignment(I.getAlign());
    NewStore->setAtomic(I.getOrdering(), I.getSyncScopeID());
    I.eraseFromParent();
  }
}

void PointersAnalyzer::visitPtrToIntInst(PtrToIntInst &I) {
  LLVMContext &Ctx = I.getContext();
  IRBuilder<> B(&I);
  Value *SrcOp = I.getPointerOperand();
  if(SrcOp->getType()->isOpaquePointerTy()) {
    Type* Int8Ptr = PointerType::get(Type::getInt8Ty(Ctx), SrcOp->getType()->getPointerAddressSpace(), true);
    Value *PreCast = B.CreateBitCast(SrcOp, Int8Ptr);
    Value *NewInst = B.CreatePtrToInt(PreCast, I.getType());
    I.replaceAllUsesWith(NewInst);
    I.eraseFromParent();
  }

}
void PointersAnalyzer::visitIntToPtrInst(IntToPtrInst &I) {
  LLVMContext &Ctx = I.getContext();
  IRBuilder<> B(&I);
  if(I.getType()->isOpaquePointerTy()) {
    Type* DestInt8Ptr = PointerType::get(Type::getInt8Ty(Ctx), I.getType()->getPointerAddressSpace(), true);
    Value *NewInst = B.CreateIntToPtr(I.getOperand(0), DestInt8Ptr);
    Value *PostCast = B.CreateBitCast(NewInst, I.getType());
    I.replaceAllUsesWith(PostCast);
    I.eraseFromParent();
  }
}
void PointersAnalyzer::visitBitCastInst(BitCastInst &I) {
  //All the ptr related Bitcasts wil be handled in function
  // removeRedundantBitCast
  //Instructions will be skipped at this monment
  // IRBuilder<> B(&I);
  // if (I.getType()->isOpaquePointerTy()) {
  //   Value *NewVal = B.CreateBitCast(I.getOperand(0), PointerType::get(B.getInt8Ty(), I.getType()->getPointerAddressSpace(), true));
  //   if (NewVal != I.getOperand(0)) {
  //     I.replaceAllUsesWith(NewVal);
  //     I.eraseFromParent();
  //   }
  // }
  return;
}

void PointersAnalyzer::visitAddrSpaceCastInst(AddrSpaceCastInst &I) {
  LLVMContext &Ctx = I.getContext();
  IRBuilder<> B(&I);
  Value *SrcOp = I.getPointerOperand();
  if(SrcOp->getType()->isOpaquePointerTy()) {
    Type* Int8Ptr = PointerType::get(Type::getInt8Ty(Ctx), SrcOp->getType()->getPointerAddressSpace(), true);
    Type* DestInt8Ptr = PointerType::get(Type::getInt8Ty(Ctx), I.getType()->getPointerAddressSpace(), true);
    Value *PreCast = B.CreateBitCast(SrcOp, Int8Ptr);
    Value *NewCast = B.CreateAddrSpaceCast(PreCast, DestInt8Ptr);
    Value *PostCast = B.CreateBitCast(NewCast, I.getType());
    I.replaceAllUsesWith(PostCast);
    I.eraseFromParent();
  }

}


void PointersAnalyzer::visitGetElementPtrInst(GetElementPtrInst &I) {
  LLVMContext &Ctx = I.getContext();
  auto* SrcPtr = I.getOperand(0);
  auto* ElemTy = I.getSourceElementType();
  IRBuilder<> B(&I);
  auto BB = I.getParent();

  if (SrcPtr->getType()->isOpaquePointerTy()) {

    LLVM_DEBUG(llvm::dbgs() << "Meet GEP: \n";
               I.print(llvm::dbgs());
               llvm::dbgs() << "\n"; );

    std::vector<Value*>Idx;
    for(auto Iter = I.idx_begin(); Iter != I.idx_end(); Iter++) {
      Idx.push_back(*Iter);
    }

    //%13 = getelementptr inbounds { i32, i32, i32, i32, ptr, i32 }, ptr %12, i64 0, i32 1
    if(isContainOpaquePointers(ElemTy)) {
      ElemTy = processType(ElemTy);
    }
    Type *NewPtrTy = PointerType::get(ElemTy, SrcPtr->getType()->getPointerAddressSpace(), true);
    Value* NewPtr = processOpaqueOperand(B, SrcPtr, NewPtrTy);
    Value *NewGEP = B.CreateGEP(ElemTy, NewPtr, Idx, "", I.isInBounds());
    //using mutateType introduce risk
    //Type *GEPRetTy = GetElementPtrInst::getGEPReturnType(ElemTy, NewPtr, Idx, true);
    //NewGEP->mutateType(GEPRetTy);

    Value* TransTemp = B.CreateBitCast(NewGEP, I.getType());

    I.replaceAllUsesWith(TransTemp);
    I.eraseFromParent();

    LLVM_DEBUG(llvm::dbgs() << "New GEP: \n";
               NewGEP->print(llvm::dbgs());
               llvm::dbgs() << "\nGEP return type: ";
               NewGEP->getType()->print(llvm::dbgs());
               llvm::dbgs() << "\n";);
    Changed |= true;
  }
}


void PointersAnalyzer::visitCallInst(CallInst &I) {
  IRBuilder<> B(&I);
  LLVMContext &Ctx = I.getContext();
  if(CallInst *CI = dyn_cast<CallInst>(&I)) {
    const Value * op = CI->getCalledOperand();
    if(const InlineAsm *IA = dyn_cast<InlineAsm>(op)) {
      for(unsigned Idx = 0; Idx < CI->arg_size(); Idx++) {
        Value* Arg = CI->getArgOperand(Idx);
        if(ConstantExpr* CE = dyn_cast<ConstantExpr>(Arg)) {
          auto* NewCE = processConstant(CE);
          if(NewCE != CE) {
            CI->setArgOperand(Idx, NewCE);
            Changed |= true;
          }
        } else if(Arg->getType()->isOpaquePointerTy()) {
          auto TypedPtrTy = PointerType::get(B.getInt8Ty(), Arg->getType()->getPointerAddressSpace(), true);
          Value *TypedSrc = B.CreateBitCast(Arg, TypedPtrTy);
          CI->setArgOperand(Idx, TypedSrc);
          Changed |= true;
        }
      }
  
      Type *RetType = IA->getFunctionType()->getReturnType();
      Type *NewRetType = processType(RetType);
      if (RetType != NewRetType){
        StringRef AsmString = IA->getAsmString();
        StringRef ConstraintString = IA->getConstraintString();
        bool IsAlignStack = IA->isAlignStack();
        bool HasSideEffects = IA->hasSideEffects();
        InlineAsm::AsmDialect Dialect = IA->getDialect();
        SmallVector<Type*, 8> ArgTypeVec;
        SmallVector<Value*, 8> ArgVec;
        for(unsigned Idx = 0; Idx < CI->arg_size(); Idx++) {
          ArgVec.push_back(CI->getArgOperand(Idx));
          ArgTypeVec.push_back(CI->getArgOperand(Idx)->getType());
        }
        FunctionType *NewFnType = llvm::FunctionType::get(NewRetType, ArgTypeVec, false);
        InlineAsm *NewIA = InlineAsm::get(
            NewFnType,
            AsmString,
            ConstraintString,
            HasSideEffects,
            IsAlignStack,
            Dialect
        );
        llvm::CallInst *NewCall = llvm::CallInst::Create(NewIA, ArgVec, "", CI);
        NewCall->copyMetadata(*CI, {LLVMContext::MD_range});
        Value* TransTemp;
        if(CI->getType()->isAggregateType()) {
          TransTemp = B.CreateIntrinsic(Intrinsic::fake_cast,
                      {CI->getType(), NewCall->getType()}, NewCall);
        } else {
          TransTemp = processPtr(B, NewCall, CI->getType());
        }
        CI->replaceAllUsesWith(TransTemp);
        CI->eraseFromParent();
        Changed |= true;
      }

      return;
    }

    StringMap<std::vector<std::string>> transInst;
    transInst["llvm.nvvm.f2bf16.rn"] = {"cvt.rn.bf16.f32 $0, $1;", "=h,r"};
    transInst["llvm.nvvm.f2bf16.rz"] = {"cvt.rz.bf16.f32 $0, $1;", "=h,r"};
    transInst["llvm.nvvm.f2bf16.rn.relu"] = {"cvt.rz.relu.bf16.f32 $0, $1;",
                                             "=h,r"};
    transInst["llvm.nvvm.f2bf16.rz.relu"] = {"cvt.rz.relu.bf16.f32 $0, $1;",
                                             "=h,r"};

    auto *Callee = CI->getCalledFunction();
    if (Callee) {
      auto it = transInst.find(Callee->getName());
      if (it != transInst.end()) {
        LLVM_DEBUG(llvm::dbgs() << "Trans Inst To PTX: ";
                   CI->print(llvm::dbgs()); llvm::dbgs() << "\n";);

        llvm::Type *RetTy = CI->getType();
        Value *Arg = CI->getArgOperand(0);
        std::string AsmStr = it->second[0];
        std::string Constraints = it->second[1];
        llvm::InlineAsm *IA = llvm::InlineAsm::get(
            llvm::FunctionType::get(RetTy, {Arg->getType()}, false),
            AsmStr, Constraints, /*hasSideEffects=*/false);
        llvm::CallInst *NewCall = llvm::CallInst::Create(
            IA, {Arg}, "", CI);
        NewCall->copyMetadata(*CI, {LLVMContext::MD_dbg, LLVMContext::MD_range});
        if (CI->isTailCall()) {
          NewCall->setTailCall(true);
        }
        CI->replaceAllUsesWith(NewCall);
        CI->eraseFromParent();

        LLVM_DEBUG(llvm::dbgs() << "After Trans:       ";
                   NewCall->print(llvm::dbgs());
                   llvm::dbgs() << "\n";);
      }
    } else {
      Value *CallVal = CI->getCalledOperand();
      //indirect call
      if(CallVal->getType()->isOpaquePointerTy()) {
        //Ctx.VoidPtrTy;
        llvm::Type* RetTy = CI->getType();
        Type* NewRetTy = processType(RetTy);
        std::vector<Value *> NewArgs;
        std::vector<Type *> NewArgsTys;
        for(unsigned Idx = 0; Idx < CI->arg_size(); Idx++) {
          Value* Arg = CI->getArgOperand(Idx);
          Value* NewArg = processOpaqueOperand(B, Arg);
          NewArgs.push_back(NewArg);
          NewArgsTys.push_back(NewArg->getType());
        }
        FunctionType* NewFTy = FunctionType::get(NewRetTy, NewArgsTys, false);
        Type* NewFPtrTy = PointerType::get(NewFTy, CallVal->getType()->getPointerAddressSpace(), true);
        Value* NewCallVal;
        if (auto GA = dyn_cast<GlobalAlias>(CallVal)){
          NewCallVal = CallVal;
        } else {
          NewCallVal = B.CreatePointerCast(CallVal, NewFPtrTy);
        }
        CallInst* NewCall = B.CreateCall(NewFTy, NewCallVal, NewArgs);
        NewCall->copyMetadata(*CI, {LLVMContext::MD_dbg, LLVMContext::MD_range});
        if (CI->isTailCall()) {
          NewCall->setTailCall(true);
        }
        NewCall->setCallingConv(CI->getCallingConv());
        NewCall->setAttributes(CI->getAttributes());
        NewCall->copyMetadata(*CI, {LLVMContext::MD_prof, LLVMContext::MD_dbg,
                                    LLVMContext::MD_range});
        Value* CastInst = B.CreateBitCast(NewCall, RetTy);
        CI->replaceAllUsesWith(CastInst);
        CI->eraseFromParent();
      }
    }
  }
}


void PointersAnalyzer::processAggregateAndVectorUse(Value* AggVal, Value* NewVal) {
  Value::user_iterator Next;
  for(Value::user_iterator UserI = AggVal->user_begin(), UserE = AggVal->user_end();
                        UserI != UserE; UserI = Next) {
    Next = std::next(UserI);
    IRBuilder<> B(dyn_cast<Instruction>(*UserI));
    if(ExtractValueInst* ExtractI = dyn_cast<ExtractValueInst>(*UserI)) {
      Value *NewExtract = B.CreateExtractValue(NewVal, ExtractI->getIndices());
      if(NewExtract->getType() != ExtractI->getType()) {
        if(ExtractI->getType()->isAggregateType()) {
          processAggregateAndVectorUse(ExtractI, NewExtract);
        } else {
          NewExtract = B.CreateBitCast(NewExtract, ExtractI->getType());
        }
      }
      ExtractI->replaceAllUsesWith(NewExtract);
      ExtractI->eraseFromParent();
    } else if (ExtractElementInst* ExtractI = dyn_cast<ExtractElementInst>(*UserI)) {
      Value *NewExtract = B.CreateExtractElement(NewVal, ExtractI->getIndexOperand());
      if(NewExtract->getType() != ExtractI->getType()) {
        if(ExtractI->getType()->isAggregateType()) {
          processAggregateAndVectorUse(ExtractI, NewExtract);
        } else {
          NewExtract = B.CreateBitCast(NewExtract, ExtractI->getType());
        }
      }
      ExtractI->replaceAllUsesWith(NewExtract);
      ExtractI->eraseFromParent();
    } else if (PHINode *Phi = dyn_cast<PHINode>(*UserI)) {
      // PHI operands conceptually live on incoming edges, so insert any needed
      // casts in the predecessor blocks (not next to the PHI).
      Type *ExpectedTy = Phi->getType();
      for (unsigned i = 0, e = Phi->getNumIncomingValues(); i != e; ++i) {
        if (Phi->getIncomingValue(i) != AggVal)
          continue;
        BasicBlock *IncomingBB = Phi->getIncomingBlock(i);
        IRBuilder<> IB(IncomingBB->getTerminator());
        Value *Replacement = NewVal;
        if (Replacement->getType() != ExpectedTy)
          Replacement = createCast(IB, Replacement, ExpectedTy);
        Phi->setIncomingValue(i, Replacement);
      }
    } else {
      // Fallback: replace other instruction uses in-place.
      // Note: this is not correct for PHIs (handled above).
      Value* PreCast = createCast(B, NewVal, AggVal->getType());
      UserI->replaceUsesOfWith(AggVal, PreCast);
    }
  }
}

void PointersAnalyzer::processPHINode(PHINode &I) {
  PHINode *PHII = &I;
  Type *PHITy = PHII->getType();
  if(!isContainOpaquePointers(PHITy))
    return;
  Type *NewPHITy = processType(PHITy);
  IRBuilder<> B(dyn_cast<Instruction>(PHII));
  auto NewPHI = B.CreatePHI(NewPHITy, PHII->getNumIncomingValues());

  for(unsigned Idx = 0; Idx <PHII->getNumIncomingValues(); Idx++) {
    Value *Opnd = PHII->getIncomingValue(Idx);
    Value *NewOpnd;
    if (Instruction *NormI = dyn_cast<Instruction>(Opnd)) {
      B.SetInsertPoint(NormI->getNextNode());
    } else {
      B.SetInsertPoint(getFirstNonAllocaInTheEntryBlock(I.getFunction()));
    }
    NewOpnd = processOpaqueOperand(B, Opnd, NewPHITy);
    NewPHI->addIncoming(NewOpnd, PHII->getIncomingBlock(Idx));
  }

  if(PHITy->isAggregateType() || PHITy->isVectorTy()) {
    processAggregateAndVectorUse(PHII, NewPHI);
    // remove PHI and its creation chain
    if(PHII->user_empty()) {
      PHII->eraseFromParent();
    } else {
      report_fatal_error("Unresolved PHI Node");
    }
  } else {
    // set the non-phi insertPt in place, in case the insert point instruction
    // changed without any notification.
    IRBuilder<> NonPhiBuilder(NewPHI->getParent(),
                              NewPHI->getParent()->getFirstInsertionPt());
    Value *PostCast = NonPhiBuilder.CreateBitCast(NewPHI, PHII->getType());
    PHII->replaceAllUsesWith(PostCast);
    PHII->eraseFromParent();
  }
}

void PointersAnalyzer::visitExtractElementInst(ExtractElementInst &I) {
  // TODO:
  // All the ptr related ExtractElement should be handled in the Vector
  if(I.getType()->isOpaquePointerTy()) {
    report_fatal_error("Unresolved Vector Extract Elements");
  }
}
void PointersAnalyzer::visitInsertElementInst(InsertElementInst &I) {
  // TODO:
  // All the ptr related InsertElement should be handled in the funtion
  // Vector&removeDeadValue
  return;
}
void PointersAnalyzer::visitExtractValueInst(ExtractValueInst &I) {
  // All the ptr related ExtractValues should be handled in the Structure
  Value *SVal = I.getAggregateOperand();
  if(isContainOpaquePointers(SVal->getType())) {
    IRBuilder<> B(&I);
    if(CallInst* SInt = dyn_cast<CallInst>(SVal)) {
      if(SInt->getIntrinsicID() == Intrinsic::fake_cast) {
        Value *OVal = SInt->getOperand(0);
        Value *NewExtract = B.CreateExtractValue(OVal, I.getIndices());
        Function *FDecl = SInt->getCalledFunction();
        if(NewExtract->getType() != I.getType()) {
          NewExtract = processPtr(B, NewExtract, I.getType());
        }
        I.replaceAllUsesWith(NewExtract);
        I.eraseFromParent();
        if(SInt->use_empty()) {
          SInt->eraseFromParent();
        }
        if(FDecl->use_empty()) {
          FDecl->eraseFromParent();
        }
      }
    }
  }
  return;
}

void PointersAnalyzer::visitPHINode(PHINode &I) {
  // All the ptr related PHINode should be handled in the processPHINode
  return;
}

void PointersAnalyzer::visitInsertValueInst(InsertValueInst &I) {
  // All the ptr related InsertValues should be handled in the Structure&removeDeadValue
  return;
}
void PointersAnalyzer::visitInstruction(Instruction &I) {
  // Check if there are unhandled instuctions
  for(unsigned Idx = 0; Idx < I.getNumOperands(); Idx++) {
    Value* opnd = I.getOperand(Idx);
    if(isContainOpaquePointers(opnd->getType())) {
      I.print(llvm::errs());
      report_fatal_error("Instruction contain opaque pointer need to be handled");
    }
    if(ConstantExpr* CE = dyn_cast<ConstantExpr>(opnd)) {
      auto* NewCE = processConstant(CE);
      if(NewCE != CE) {
        I.replaceUsesOfWith(CE, NewCE);
      }
    }
  }
}

/*
void PointersAnalyzer::visitLandingPadInst(LandingPadInst &I) {
  LLVMContext &Ctx = I.getContext();
  IRBuilder<> B(&I);
  if(isContainOpaquePointers(I.getType())) {
    Type* NewTy = processType(I.getType());
    SmallVector<Constant*> Clause;
    for(unsigned Idx = 0; Idx < I.getNumClauses(); Idx ++) {
      auto* CT = I.getClause(Idx);
      auto* NewCT = dyn_cast<Constant>(processPtr(B, CT, NewTy));
      Clause.push_back(NewCT);
    }
    auto* NewInst = B.CreateLandingPad(NewTy, I.getNumClauses());
    for(unsigned Idx = 0; Idx < I.getNumClauses(); Idx ++) {
      NewInst->addClause(Clause[Idx]);
    }
    auto* PostCast = processPtr(B, NewInst, I.getType());
    I.replaceAllUsesWith(PostCast);
    I.eraseFromParent();
  }
}
*/

void PointersAnalyzer::visitSelectInst(SelectInst &I) {
  LLVMContext &Ctx = I.getContext();
  IRBuilder<> B(&I);
  Value* Condition = I.getCondition();
  Value* TrueVal = I.getTrueValue();
  Value* FalseVal = I.getFalseValue();
  if(!I.getType()->isOpaquePointerTy())
    return;
  if(TrueVal->getType()->isOpaquePointerTy()) {
    Type* Int8Ptr = PointerType::get(Type::getInt8Ty(Ctx), TrueVal->getType()->getPointerAddressSpace(), true);
    TrueVal = B.CreateBitCast(TrueVal, Int8Ptr);
  } else {
    report_fatal_error("Unconsistent select operand");
  }
  if(FalseVal->getType()->isOpaquePointerTy()) {
    Type* Int8Ptr = PointerType::get(Type::getInt8Ty(Ctx), FalseVal->getType()->getPointerAddressSpace(), true);
    FalseVal = B.CreateBitCast(FalseVal, Int8Ptr);
  } else {
    report_fatal_error("Unconsistent select operand");
  }
  Type* Int8Ptr = PointerType::get(Type::getInt8Ty(Ctx), I.getType()->getPointerAddressSpace(), true);
  Value* NewSel = B.CreateSelect(Condition, TrueVal, FalseVal);
  Value* PostCast = B.CreateBitCast(NewSel, I.getType());
  I.replaceAllUsesWith(PostCast);
  I.eraseFromParent();
}

void PointersAnalyzer::visitAtomicCmpXchgInst(AtomicCmpXchgInst &I) {
  IRBuilder<> B(&I);
  Value *PtrOpnd = I.getPointerOperand();
  Type *PtrOpndTy = PtrOpnd->getType();
  if(PtrOpndTy->isOpaquePointerTy()) {
    Value *CompValue = I.getCompareOperand();
    Value *NewValue = I.getNewValOperand();
    Type *NewPtrTy = PointerType::get(CompValue->getType(), PtrOpndTy->getPointerAddressSpace(), true);
    Value *PreCast = B.CreateBitCast(PtrOpnd, NewPtrTy);
    Value *NewInst = B.CreateAtomicCmpXchg(PreCast, CompValue, NewValue, I.getAlign(),
                       I.getSuccessOrdering(), I.getFailureOrdering(), I.getSyncScopeID());
    I.replaceAllUsesWith(NewInst);
    I.eraseFromParent();
  }
}
void PointersAnalyzer::visitAtomicRMWInst(AtomicRMWInst &I) {
  IRBuilder<> B(&I);
  Value *PtrOpnd = I.getPointerOperand();
  Type *PtrOpndTy = PtrOpnd->getType();
  if(PtrOpndTy->isOpaquePointerTy()) {
    Value *SrcValue = I.getValOperand();
    Type *NewPtrTy = PointerType::get(SrcValue->getType(), PtrOpndTy->getPointerAddressSpace(), true);
    Value *PreCast = B.CreateBitCast(PtrOpnd, NewPtrTy);
    Value *NewInst = B.CreateAtomicRMW(I.getOperation(), PreCast, SrcValue, I.getAlign(),
                                      I.getOrdering(), I.getSyncScopeID());
    I.replaceAllUsesWith(NewInst);
    I.eraseFromParent();
  }
}

void PointersAnalyzer::visitReturnInst(ReturnInst &I) {
  Value *RetVal = I.getReturnValue();
  if(RetVal!= nullptr) {
    if(isContainOpaquePointers(RetVal->getType())) {
      IRBuilder<> B(&I);
      Type* RetTy = I.getFunction()->getReturnType();
      Value *NewVal = processPtr(B, RetVal, RetTy);
      Value *NewRet = B.CreateRet(NewVal);
      I.replaceAllUsesWith(NewRet);
      I.eraseFromParent();
    }
  }
}

void PointersAnalyzer::visitVAArgInst(VAArgInst &I) {
  Value *PVal = I.getPointerOperand();
  Type *PType = PVal->getType();
  Type *NewTy = processType(PType);
  // FIXME: alloca va_arg val is i8**, others is i8*
  if (AllocaInst *AI = dyn_cast<AllocaInst>(getUnderlyingObject(PVal))) {
    if (AI->getAllocatedType()->isPointerTy()) {
      NewTy = PointerType::get(NewTy, PVal->getType()->getPointerAddressSpace(),
                               true);
    }
  }

  IRBuilder<> B(&I);
  if (PType != NewTy) {
    PVal = B.CreateBitCast(PVal, NewTy);
  }
  Type *NewValTy = processType(I.getType());
  VAArgInst *NewI = B.CreateVAArg(PVal, NewValTy);
  I.replaceAllUsesWith(NewI);
  I.eraseFromParent();
}

StructType* PointersAnalyzer::processStructType(StructType* STy) {
  std::vector<Type*> TyList;
  LLVMContext &Ctx = STy->getContext();
  for(auto SubTy : STy->subtypes()) {
    if(isContainOpaquePointers(SubTy)) {
      auto* NewSubTy = processType(SubTy);
      TyList.push_back(NewSubTy);
    } else {
      TyList.push_back(SubTy);
    }
  }
  auto* NewTy = StructType::get(Ctx, TyList, STy->isPacked());
  return NewTy;
}

ArrayType* PointersAnalyzer::processArrayType(ArrayType* ATy) {
  Type* EltTy = ATy->getElementType();
  auto* NewEltTy = processType(EltTy);
  auto* NewTy = ArrayType::get(NewEltTy, ATy->getNumElements());
  return NewTy;
}

VectorType* PointersAnalyzer::processVectorType(VectorType* VTy) {
  Type* EltTy = VTy->getElementType();
  auto* NewEltTy = processType(EltTy);
  auto NewTy = VectorType::get(NewEltTy, VTy->getElementCount());
  return NewTy;
}

Type* PointersAnalyzer::processType(Type* Ty) {
  IRBuilder<> B(Ty->getContext());
  if(!isContainOpaquePointers(Ty)) return Ty;

  if(Ty->isOpaquePointerTy()) {
    auto TypedPtrTy = PointerType::get(B.getInt8Ty(), Ty->getPointerAddressSpace(), true);
    return TypedPtrTy;
  } else if (StructType *STy = dyn_cast<StructType>(Ty)) {
    StructType *NewSTy = processStructType(STy);
    return NewSTy;
  } else if (ArrayType *ATy = dyn_cast<ArrayType>(Ty)) {
    ArrayType *NewATy = processArrayType(ATy);
    return NewATy;
  } else if (VectorType *VTy = dyn_cast<VectorType>(Ty)) {
    VectorType *NewVTy = processVectorType(VTy);
    return NewVTy;
  } else {
    report_fatal_error("New nested isAggregateType need to handle");
  }
}

bool PointersAnalyzer::processFunctionArguments(Function *&F) {
  IRBuilder<> B(F->getContext());
  FunctionType *FuncTy = F->getFunctionType();
  std::vector<llvm::Type *> ParamsTys;
  // all function need change because of potential function reference(function pointer)
  bool needChange = true;
  bool ParamChange = false;
  bool RetChange = false;
  bool DeleteFunc = true;
  ConstantAsMetadata *MD = llvm::ConstantAsMetadata::getIfExists(F);

  for (unsigned Idx = 0; Idx < FuncTy->getNumParams(); Idx++) {
    Type *ParamTy = FuncTy->getParamType(Idx);
    if (F->hasParamAttribute(Idx, Attribute::ByVal)) {
      LLVM_DEBUG(llvm::dbgs() << "param No." << Idx << " has ByVal\n";);
      Attribute ByValAttr = F->getParamAttribute(Idx, Attribute::ByVal);
      Type *ByValType = ByValAttr.getValueAsType();
      Type *NewPtrTy = PointerType::get(ByValType, ParamTy->getPointerAddressSpace(), true);
      ParamsTys.push_back(NewPtrTy);
    } else if (isContainOpaquePointers(ParamTy)) {
      Type *NewTy = processType(ParamTy);
      ParamsTys.push_back(NewTy);
    } else {
      ParamsTys.push_back(ParamTy);
    }
  }

  Type *ResTy = FuncTy->getReturnType();
  if (isContainOpaquePointers(ResTy)) {
    ResTy = processType(ResTy);
    RetChange = true;
  }
  if(needChange) {
    FunctionType* NewFTy = FunctionType::get(ResTy, ParamsTys, FuncTy->isVarArg());
    LLVM_DEBUG(llvm::dbgs() << "new function type: ";
               NewFTy->print(llvm::dbgs());
               llvm::dbgs() << "\n"; );

    Function *NewFn = llvm::Function::Create(NewFTy, F->getLinkage(), F->getAddressSpace(), true);
    NewFn->copyAttributesFrom(F);
    NewFn->setComdat(F->getComdat());
    F->getParent()->getFunctionList().insert(F->getIterator(), NewFn);
    NewFn->takeName(F);

    LLVM_DEBUG(llvm::dbgs() << "new function: ";
               NewFn->print(llvm::dbgs());
               llvm::dbgs() << "\n"; );

    if(!F->isDeclaration()) {
      NewFn->splice(NewFn->begin(), F);
      auto I = NewFn->begin()->begin();
      for(unsigned Idx = 0; Idx < NewFn->arg_size(); Idx++) {
        Value *OldArg = F->getArg(Idx);
        Value *NewArg = NewFn->getArg(Idx);
        if(OldArg->getType() != NewArg->getType()) {
          IRBuilder<> B(&*I);
          Value* CastParam;
          if(OldArg->getType()->isAggregateType()) {
            CastParam = B.CreateIntrinsic(Intrinsic::fake_cast,
              {OldArg->getType(), NewArg->getType()}, NewArg);
          } else {
            CastParam = processPtr(B, NewArg, OldArg->getType());
          }
          //Value* CastParam = B.CreateBitCast(NewArg, OldArg->getType());
          OldArg->replaceAllUsesWith(CastParam);
        } else {
          OldArg->replaceAllUsesWith(NewArg);
        }
      }
    }

    if(NewFn->getName() == "__nvvm_reflect") {
      LLVMContext &Ctx = F->getContext();
      Value::user_iterator Next;
      for(Value::user_iterator UserI = F->user_begin(), UserE = F->user_end();
                          UserI != UserE; UserI = Next) {
        Next = std::next(UserI);
        if(CallInst *CI = dyn_cast<CallInst>(*UserI)) {
          IRBuilder<> B(CI);
          Value* Arg = CI->getArgOperand(0);
          GlobalVariable* GV = dyn_cast<GlobalVariable>(Arg);
          auto TypedPtrTy = PointerType::get(GV->getValueType(), Arg->getType()->getPointerAddressSpace(), true);
          if(Arg->getType()->isOpaquePointerTy())
            Arg->mutateType(TypedPtrTy);

          Value *Idx[2] = {
          ConstantInt::get(Type::getInt32Ty(Ctx), 0),
          ConstantInt::get(Type::getInt32Ty(Ctx), 0)};
          //in the legacy version, the reflect is like
          //%1 = call i32 @__nvvm_reflect(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0))
          auto TypedTy = GV->getValueType();
          auto RetTy = PointerType::get(B.getInt8Ty(), Arg->getType()->getPointerAddressSpace(), true);
          Constant *GEP =
                    ConstantExpr::getInBoundsGetElementPtr(TypedTy, dyn_cast<Constant>(Arg), Idx, true, true);

          LLVM_DEBUG(llvm::dbgs() << "create reflect GEP: ";
                     GEP->print(llvm::dbgs());
                     llvm::dbgs() << "\n"; );

          CallInst *NewCI = B.CreateCall(NewFn, GEP);
          NewCI->copyMetadata(*CI, {LLVMContext::MD_range});
          CI->replaceAllUsesWith(NewCI);
          CI->eraseFromParent();
        } else {
          UserI->replaceUsesOfWith(F, NewFn);
        }
      }
    } else {
      Value::user_iterator Next;
      for(Value::user_iterator UserI = F->user_begin(), UserE = F->user_end();
                          UserI != UserE; UserI = Next) {
        Next = std::next(UserI);
        if(CallBase *CI = dyn_cast<CallBase>(*UserI)) {
          IRBuilder<> B(CI);
          std::vector<Value *> ArgList;
          bool RebuildCall = CI->getCalledFunction() == F;

          for(unsigned Idx = 0; Idx < CI->arg_size(); Idx++) {
            Value * Arg = CI->getArgOperand(Idx);
            if (isa<Function>(Arg) && Arg == F) {
              Value *NewArg = NewFn;
              Type *ArgType = Arg->getType();
              if (ArgType && (ArgType != NewFn->getType())) {
                NewArg = B.CreateBitCast(NewFn, ArgType);
              }
              Arg->replaceAllUsesWith(NewArg);
            }
            if (RebuildCall) {
              if (Idx < ParamsTys.size())
                Arg = processOpaqueOperand(B, Arg, ParamsTys[Idx]);
              else
                Arg = processOpaqueOperand(B, Arg);
              ArgList.push_back(Arg);
            }
          }

          LLVM_DEBUG(
            llvm::dbgs() << "ArgList size: " << ArgList.size() << "\n";
            llvm::dbgs() << "ArgList: ";
                      for(auto elem : ArgList){
                        elem->print(llvm::dbgs());
                        llvm::dbgs() << "\n";
                      }
                     llvm::dbgs() << "\n";
          );

          SmallVector<OperandBundleDef, 1> OpBundles;
          CI->getOperandBundlesAsDefs(OpBundles);

          if(RebuildCall) {
            // used as called function
            CallBase *NewCI = nullptr;
            if (InvokeInst *II = dyn_cast<InvokeInst>(CI)) {
              NewCI = InvokeInst::Create(NewFn, II->getNormalDest(), II->getUnwindDest(),
                                        ArgList, OpBundles, "", CI);
            } else if (CallInst *CIT = dyn_cast<CallInst>(CI)) {
              NewCI = CallInst::Create(NewFn, ArgList, OpBundles, "", CI);
              cast<CallInst>(NewCI)->setTailCallKind(
                  cast<CallInst>(NewCI)->getTailCallKind());
            } else {
              report_fatal_error("unhandled call base");
            }
            NewCI->setCallingConv(CI->getCallingConv());
            NewCI->setAttributes(CI->getAttributes());
            NewCI->copyMetadata(*CI, {LLVMContext::MD_prof, LLVMContext::MD_dbg,
                                        LLVMContext::MD_range});

            if(RetChange) {
              Value* TransTemp;
              if(CI->getType()->isAggregateType()) {
                TransTemp = B.CreateIntrinsic(Intrinsic::fake_cast,
                            {CI->getType(), NewCI->getType()}, NewCI);
              } else {
                TransTemp = processPtr(B, NewCI, CI->getType());
              }
              //TransTemp = B.CreateBitCast(NewCI, CI->getType());
              CI->replaceAllUsesWith(TransTemp);
            } else {
              CI->replaceAllUsesWith(NewCI);
            }
            CI->eraseFromParent();
          } else {
            // used as arguments
            Value* postCast = createCast(B, NewFn, F->getType());
            CI->replaceUsesOfWith(F, postCast);
          }
        } else if (Constant* CF = dyn_cast<Constant>(*UserI)) {
          // constant  can't use replaceUsesOfWith
          // will be handled within the constant
          FuncConstantUser.insert(CF);
          DeleteFunc = false;
        } else {
          // Fix up any BlockAddresses that refer to the function.
          UserI->replaceUsesOfWith(F, ConstantExpr::getBitCast(NewFn, F->getType()));
        }
      }
      // Clone metadatas from the old function, including debug info descriptor.
      SmallVector<std::pair<unsigned, MDNode *>, 1> MDs;
      F->getAllMetadata(MDs);
      for (auto MD : MDs)
        NewFn->addMetadata(MD.first, *MD.second);

      // Delete the bitcast that we just created, so that NF does not
      // appear to be address-taken.
      NewFn->removeDeadConstantUsers();
    }

    if(MD) {
      //ConstantAsMetadata * NewMD = llvm::ConstantAsMetadata::get(NewFn);
      //llvm::ConstantAsMetadata::handleRAUW(MD, NewMD);
      MD->handleRAUW(F, NewFn);
      //MD->replaceAllUsesWith(NewMD);
    }

    if(DeleteFunc) {
      F->eraseFromParent();
    } else {
      //function used in constant will be captured in FunctionRemoveMap
      // and removed at last.
      FunctionRemoveMap.insert(std::make_pair(F, NewFn));
    }
    F = NewFn;

    Changed |= true;
    return true;
  }
  return false;
}

void PointersAnalyzer::removeRedundantBitCast(Module &M) {
  for (Function &F : M) {
    SmallVector<BitCastInst *, 16> BCListToPtr;
    SmallVector<BitCastInst *, 16> BCListFromPtr;
    for (BasicBlock &BB : F) {
      BCListFromPtr.clear();
      BCListToPtr.clear();
      BasicBlock::iterator Next;
      for (BasicBlock::iterator I = BB.begin(), E = BB.end(); I != E;
           I = Next) {
        Next = std::next(I);
        if (BitCastInst *BI = dyn_cast<BitCastInst>(&*I)) {
          if (isContainOpaquePointers(BI->getType())) {
            BCListToPtr.push_back(BI);
          } else if (isContainOpaquePointers(BI->getOperand(0)->getType())) {
            BCListFromPtr.push_back(BI);
          }
        }
      }

      // find the pair that
      //  bitcast typedptr to ptr
      //  bitcast ptr to typedptr
      reverse(BCListToPtr);
      while (!BCListToPtr.empty()) {
        auto BIT = BCListToPtr.back();
        BCListToPtr.pop_back();
        LLVM_DEBUG(llvm::dbgs() << "find bitcast to ptr: ";
                   BIT->print(llvm::dbgs()); llvm::dbgs() << "\n";);
        Value *Src = BIT->getOperand(0);
        Type *SrcTy = Src->getType();

        Value::user_iterator Next;
        for (Value::user_iterator UserI = BIT->user_begin(),
                                  UserE = BIT->user_end();
             UserI != UserE; UserI = Next) {
          Next = std::next(UserI);
          if (BitCastInst *BI = dyn_cast<BitCastInst>(*UserI)) {
            IRBuilder<> B(BI);
            if (BI->getType() == SrcTy) {
              LLVM_DEBUG(llvm::dbgs() << "eliminate reversed bitcast: ";
                         BI->print(llvm::dbgs()); llvm::dbgs() << "\n";);
              BI->replaceAllUsesWith(Src);
              BI->eraseFromParent();
            } else {
              LLVM_DEBUG(llvm::dbgs() << "merge bitcast: ";
                         BI->print(llvm::dbgs()); llvm::dbgs() << "\n";);
              // merge bitcast
              Value *TransNew = B.CreateBitCast(Src, BI->getType());
              BitCastInst *NewBI = dyn_cast<BitCastInst>(TransNew);
              if (NewBI && isContainOpaquePointers(NewBI->getType())) {
                BCListToPtr.push_back(NewBI);
              }
              BI->replaceAllUsesWith(TransNew);
              BI->eraseFromParent();
            }
          }
        }
        if (BIT->use_empty()) {
          ValueAsMetadata *VAM = ValueAsMetadata::get(BIT);
          MetadataAsValue *MAV = MetadataAsValue::get(M.getContext(), VAM);
          if (!MAV || MAV->use_empty())
            BIT->eraseFromParent();
        }
      }
    }
  }
}

void PointersAnalyzer::removeFakeCast(Module &M) {
  SmallSet<Function*, 8> IntriscsDecl;
  for(Function &F : M) {
    std::vector<CallInst*> CastListToPtr;
    std::vector<CallInst*> CastListFromPtr;
    for(BasicBlock &BB : F) {
      BasicBlock::iterator Next;
      for (BasicBlock::iterator I = BB.begin(), E = BB.end();
                                    I != E; I = Next) {
        Next = std::next(I);
        if(CallInst* SInt = dyn_cast<CallInst>(&*I)) {
          if(SInt->getIntrinsicID() == Intrinsic::fake_cast) {
            IntriscsDecl.insert(SInt->getCalledFunction());
            if(isContainOpaquePointers(SInt->getType())) {
              CastListToPtr.push_back(SInt);
            } else if (isContainOpaquePointers(SInt->getOperand(0)->getType())) {
              CastListFromPtr.push_back(SInt);
            } else  {
              report_fatal_error("error fake cast");
            }
          }
        }
      }
    }
    for(auto* CIT : CastListToPtr) {
      Value *Src = CIT->getOperand(0);
      Type *SrcTy = Src->getType();

      Value::user_iterator Next;
      for(Value::user_iterator UserI = CIT->user_begin(), UserE = CIT->user_end();
                            UserI != UserE; UserI = Next) {
        Next = std::next(UserI);
        if(CallInst* SInt = dyn_cast<CallInst>(*UserI)) {
          if(SInt->getIntrinsicID() == Intrinsic::fake_cast) {
            if(SInt->getType() == SrcTy) {
              SInt->replaceAllUsesWith(Src);
              SInt->eraseFromParent();
            } else {
              report_fatal_error("error fake cast");
            }
          }
        }
      }
      if(CIT->use_empty()) {
        CIT->eraseFromParent();
      }
    }
  }
  for(auto *F : IntriscsDecl) {
    if(F->use_empty()) {
      F->eraseFromParent();
    }
  }
}

void PointersAnalyzer::processMetaData(Module &M) {
  SmallVector<std::pair<GlobalVariable&, DIGlobalVariableExpression*>, 8> ToUpgrade;

  for(auto &GV : M.globals()) {
    if (!GV.getMetadata(LLVMContext::MD_dbg))
      continue;
    if (auto *GVE = 
          dyn_cast<DIGlobalVariableExpression>(GV.getMetadata(LLVMContext::MD_dbg))) {
      DIGlobalVariable *DGV = GVE->getVariable();
      if (DGV && DGV->getName().empty()) {
        ToUpgrade.emplace_back(GV, GVE);
      }
    }
  }

  for (auto &Pair : ToUpgrade) {
    GlobalVariable  &GV = Pair.first;
    DIGlobalVariableExpression *GVE = Pair.second;
    DIGlobalVariable *DGV = GVE->getVariable();
    MDString *NewMDStr = MDString::get(M.getContext(), GV.getName());
    unsigned Index = 0;
    for (MDOperand* It = DGV->mutable_begin(); It != DGV->mutable_end(); It++) {
      // For DIGlobalVariable, Add name field (Operand Index 1)
      if (Index == 1 && !(It->get())) {
        It->reset(NewMDStr, DGV);
      }
      Index++;
    }
  }
}

bool PointersAnalyzer::processFunction(Function* &F) {
  bool ret = false;
  if(FunctionMap.find(F) != FunctionMap.end() && FunctionMap[F] == false && F) {
    FunctionMap[F] = true;
    ret = processFunctionArguments(F);
    if(F->isDeclaration()) return ret;
    //process function body
    for (BasicBlock &BB : *F) {
      BasicBlock::iterator Next;
      for (BasicBlock::iterator I = BB.begin(), E = BB.end();
                                    I != E; I = Next) {
        Next = std::next(I);
        visit(*I);
      }
    }
  }
  return ret;
}


void PointersAnalyzer::processFunctions(Module& M) {
  for (auto &Iter : FunctionMap) {
    Function *F = Iter.first;
    processFunction(F);
  }
  if (!MDContainer.empty()) {
    NamedMDNode *NMD = M.getOrInsertNamedMetadata("fmt.container");
    for (auto MD : MDContainer)
      NMD->addOperand(MD);
  }
  for (Constant* CU : FuncConstantUser) {
    processConstant(CU);
    if (ConstantExpMap.find(CU) != ConstantExpMap.end()) {
      auto NewCE = ConstantExpMap[CU];
      CU->replaceAllUsesWith(NewCE);
    }
  }
}

bool PointersAnalyzer::processMaskedIntrinsics(Module &M) {
  SmallVector<Function *, 8> DeclsToUpgrade;
  for (Function &F : M) {
    if (!F.isDeclaration()) continue;
    unsigned IID = F.getIntrinsicID();
    if (!isMaskedIntrinsic(F.getIntrinsicID())) continue;
    if (F.arg_size() != 3) continue;
    DeclsToUpgrade.push_back(&F);
  }
  if (DeclsToUpgrade.empty())
    return Changed;

  for (Function *OldFn : DeclsToUpgrade) {
    Intrinsic::ID IID = OldFn->getIntrinsicID();
    bool IsLoadGather = (IID == Intrinsic::masked_load ||
                         IID == Intrinsic::masked_gather);
    unsigned PtrIdx = IsLoadGather ? 0 : 1;
    Type *RetTy = OldFn->getReturnType();
    Type *PtrTy = PointerType::get(M.getContext(), 0);

    // Build 4-arg function type
    SmallVector<Type *, 4> NewParams;
    if (IsLoadGather) {
      // (ptr, i32, mask, passthru)
      NewParams.push_back(PtrTy);
      NewParams.push_back(Type::getInt32Ty(M.getContext()));
      NewParams.push_back(OldFn->getArg(1)->getType());
      NewParams.push_back(OldFn->getArg(2)->getType());
    } else {
      // (val, ptr, i32, mask)
      NewParams.push_back(OldFn->getArg(0)->getType());
      NewParams.push_back(PtrTy);
      NewParams.push_back(Type::getInt32Ty(M.getContext()));
      NewParams.push_back(OldFn->getArg(2)->getType());
    }

    FunctionType *NewFTy =
        FunctionType::get(RetTy, NewParams, /*isVarArg=*/false);

    // Rename old and create new declaration
    std::string OrigName = std::string(OldFn->getName());
    OldFn->setName(OrigName + ".old");
    Function *NewFn = Function::Create(NewFTy, OldFn->getLinkage(),
                                       OldFn->getAddressSpace(),
                                       OrigName, &M);
    NewFn->copyAttributesFrom(OldFn);

    // Replace all uses
    while (!OldFn->use_empty()) {
      User *Usr = *OldFn->user_begin();
      CallBase *CB = dyn_cast<CallBase>(Usr);
      if (CB && CB->getCalledFunction() == OldFn) {
        // Compute alignment from param attribute or data layout
        Value *PtrOp = CB->getArgOperand(PtrIdx);
        unsigned AlignVal = 1;
        if (Argument *A = dyn_cast<Argument>(PtrOp)) {
          if (A->hasAttribute(Attribute::Alignment)) {
            MaybeAlign MA = A->getAttribute(Attribute::Alignment).getAlignment();
            if (MA) AlignVal = MA->value();
          }
        }
        if (AlignVal == 1) {
          Attribute AlignAttr = CB->getParamAttr(PtrIdx, Attribute::Alignment);
          if (AlignAttr.isValid()) {
            MaybeAlign MA = AlignAttr.getAlignment();
            if (MA && MA->value() != 0) AlignVal = MA->value();
          }
        }
        if (AlignVal == 1) {
          Type *ValTy = IsLoadGather ? RetTy : OldFn->getArg(0)->getType();
          unsigned EltSize =
              ValTy->getScalarType()->getPrimitiveSizeInBits() / 8;
          Align DefaultAlign(EltSize ? EltSize : 4);
          Align PtrAlign = PtrOp->getPointerAlignment(M.getDataLayout());
          AlignVal = std::max(DefaultAlign, PtrAlign).value();
        }

        Value *AlignOp =
            ConstantInt::get(Type::getInt32Ty(M.getContext()), AlignVal);

        SmallVector<Value *, 4> NewArgs;
        if (IsLoadGather) {
          NewArgs.push_back(CB->getArgOperand(0)); // ptr
          NewArgs.push_back(AlignOp);
          NewArgs.push_back(CB->getArgOperand(1)); // mask
          NewArgs.push_back(CB->getArgOperand(2)); // passthru
        } else {
          NewArgs.push_back(CB->getArgOperand(0)); // val
          NewArgs.push_back(CB->getArgOperand(1)); // ptr
          NewArgs.push_back(AlignOp);
          NewArgs.push_back(CB->getArgOperand(2)); // mask
        }

        CallInst *NewCall = CallInst::Create(NewFTy, NewFn, NewArgs, "", CB);
        NewCall->setCallingConv(CB->getCallingConv());
        NewCall->setDebugLoc(CB->getDebugLoc());
        NewCall->copyMetadata(*CB);
        if (auto *OldCI = dyn_cast<CallInst>(CB))
          NewCall->setTailCallKind(OldCI->getTailCallKind());

        if (IsLoadGather)
          CB->replaceAllUsesWith(NewCall);
        CB->eraseFromParent();
      } else {
        CB
            ? CB->replaceUsesOfWith(OldFn, ConstantExpr::getBitCast(NewFn, OldFn->getType()))
            : Usr->replaceUsesOfWith(OldFn, ConstantExpr::getBitCast(NewFn, OldFn->getType()));
      }
    }
    OldFn->removeDeadConstantUsers();
    OldFn->eraseFromParent();
    Changed = true;
  }

  return Changed;
}


#define DEBUG_TYPE "verify-pointers"

namespace {
class VerifyAnalyzer:public InstVisitor<VerifyAnalyzer> {

public:
  VerifyAnalyzer()=default;
  void visitInstruction(Instruction &I);
  void visitModule(Module &M);
  void visitFunction(Function &F);
  bool runOnModule(Module &M);
};
}

bool VerifyAnalyzer::runOnModule(Module &M) {
  visit(M);
  return false;
}


void VerifyAnalyzer::visitFunction(Function &F) {
  FunctionType *FuncTy = F.getFunctionType();
  unsigned IID = F.getIntrinsicID();
  for (auto *EltTy : FuncTy->params()) {
    if (isContainOpaquePointers(EltTy)) {
      // Allow opaque pointer types in masked intrinsics
      if (isMaskedIntrinsic(IID) && (EltTy->isPointerTy() || EltTy->isVectorTy()))
        continue;
      F.print(llvm::errs());
      llvm::errs() << "\n";
      report_fatal_error("Function contain opaque pointer need to be handled");
    }
  }
}

void VerifyAnalyzer::visitModule(Module &M) {
  for(auto &GV : M.globals()) {
    if(GV.getType()->isOpaquePointerTy()) {
      if(!GV.hasInitializer())
        continue;
      GV.print(llvm::errs());
      llvm::errs() << "\n";
      report_fatal_error("Global Variable contain opaque pointer need to be handled");
    }
    if(GV.hasInitializer()) {
      auto* Initializer = GV.getInitializer();
      if(ConstantAggregate* CA = dyn_cast<ConstantAggregate>(Initializer)) {
        if(isContainOpaquePointers(CA->getType())) {
          GV.print(llvm::errs());
          llvm::errs() << "\n";
          report_fatal_error("Global Variable contain opaque pointer need to be handled");
        }
      }
    }
  }
}

void VerifyAnalyzer::visitInstruction(Instruction &I) {

  LLVM_DEBUG(llvm::dbgs() << "Verify instruction: ";
              I.print(llvm::dbgs());
              llvm::dbgs() << "\n"; );

  // Check if there are unhandled instuctions
  for(unsigned Idx = 0; Idx < I.getNumOperands(); Idx++) {
    Value* opnd = I.getOperand(Idx);

    // keep inlineAsm type, because inlineAsm will be only used once
    if(isa<InlineAsm>(opnd))
      continue;

    if (isContainOpaquePointers(opnd->getType())) {
      // GlobalAlias always get ptr type
      if (isa<GlobalAlias>(opnd))
        continue;
      // For masked intrinsics, pointer arguments are opaque ptr (or vector of ptr)
      // which is expected and should not trigger error
      if (CallBase *CB = dyn_cast<CallBase>(&I)) {
        if (Function *F = CB->getCalledFunction()) {
          unsigned IID = F->getIntrinsicID();
          if (isMaskedIntrinsic(IID)) {
            // Check if this operand is a pointer type or vector of pointer type
            Type *OpTy = opnd->getType();
            if ((OpTy->isPointerTy() && !isa<FunctionType>(OpTy)) ||
                (OpTy->isVectorTy() && OpTy->getScalarType()->isPointerTy() &&
                 !isa<FunctionType>(OpTy->getScalarType()))) {
              continue;
            }
          }
        }
      }
      I.print(llvm::errs());
      llvm::errs() << "\n";
      report_fatal_error("Instruction contain opaque pointer need to be handled");
    }
  }
}


PreservedAnalyses VerifyPointers::run(Module &M, ModuleAnalysisManager &MAM) {
  VerifyAnalyzer Analyzer;

  Analyzer.runOnModule(M);

  return PreservedAnalyses::all();
}