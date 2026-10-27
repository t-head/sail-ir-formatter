//===- llvm-extract.cpp - LLVM function extraction utility ----------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This utility changes the input module to only contain a single function,
// which is primarily used for debugging transformations.
//
//===----------------------------------------------------------------------===//

#include "llvm/ADT/SetVector.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/Bitcode/BitcodeWriterPass.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/IRPrintingPasses.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IRPrinter/IRPrintingPasses.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Error.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/Regex.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/SystemUtils.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Transforms/IPO.h"
#include "llvm/Transforms/IPO/BlockExtractor.h"
#include "llvm/Transforms/IPO/ExtractGV.h"
#include "llvm/Transforms/IPO/GlobalDCE.h"
#include "llvm/Transforms/IPO/StripDeadPrototypes.h"
#include "llvm/Transforms/IPO/StripSymbols.h"
#include "llvm/Transforms/Utils/TypingPointers.h"
#include "llvm/Transforms/Utils/TransMemoryAttr.h"
#include "llvm/IR/LegacyPassManager.h"
#include <memory>
#include <utility>

using namespace llvm;

cl::OptionCategory FormatterCat("sail-irformatter Options");

// InputFilename - The filename to read from.
static cl::opt<std::string> InputFilename(cl::Positional,
                                          cl::desc("<input bitcode file>"),
                                          cl::init("-"),
                                          cl::value_desc("filename"));

static cl::opt<std::string> OutputFilename("o",
                                           cl::desc("Specify output filename"),
                                           cl::value_desc("filename"),
                                           cl::init("-"), cl::cat(FormatterCat));

static cl::opt<bool> Force("f", cl::desc("Enable binary output on terminals"),
                           cl::cat(FormatterCat));

static cl::opt<bool> TypingPtrs("type-pointers",
                              cl::desc("Typed all opaque pointers"),
                              cl::init(true),
                              cl::cat(FormatterCat));

static cl::opt<bool> VerifyPtrs("verify-pointers",
                              cl::desc("Check no opaque pointers"),
                              cl::init(false),
                              cl::cat(FormatterCat));

static cl::opt<bool> TransMemAttr("trans-memory-attributes",
                              cl::desc("Transform all memory access attributes"),
                              cl::init(true),
                              cl::cat(FormatterCat));

static cl::opt<bool> OutputAssembly("S",
                                    cl::desc("Write output as LLVM assembly"),
                                    cl::Hidden, cl::cat(FormatterCat));

static cl::opt<bool> PreserveBitcodeUseListOrder(
    "preserve-bc-uselistorder",
    cl::desc("Preserve use-list order when writing LLVM bitcode."),
    cl::init(true), cl::Hidden, cl::cat(FormatterCat));

static cl::opt<bool> PreserveAssemblyUseListOrder(
    "preserve-ll-uselistorder",
    cl::desc("Preserve use-list order when writing LLVM assembly."),
    cl::init(false), cl::Hidden, cl::cat(FormatterCat));

int main(int argc, char **argv) {
  InitLLVM X(argc, argv);

  LLVMContext Context;
  //Context.setOpaquePointers(false);
  cl::HideUnrelatedOptions(FormatterCat);
  cl::ParseCommandLineOptions(argc, argv, "llvm ir formatter\n");

  // Use lazy loading, since we only care about selected global values.
  SMDiagnostic Err;
  std::unique_ptr<Module> M = parseIRFile(InputFilename, Err, Context);

  if (!M.get()) {
    Err.print(argv[0], errs());
    return 1;
  }

  ModuleAnalysisManager MAM;

  PassBuilder PB;

  PB.registerModuleAnalyses(MAM);

  ModulePassManager PM;

  std::error_code EC;
  ToolOutputFile Out(OutputFilename, EC, sys::fs::OF_None);
  if (EC) {
    errs() << EC.message() << '\n';
    return 1;
  }
  if(TypingPtrs)
    PM.addPass(TypingPointers());

  if(VerifyPtrs)
    PM.addPass(VerifyPointers());

  if(TransMemAttr)
    PM.addPass(TransMemoryAttr());

  if (OutputAssembly)
    PM.addPass(PrintModulePass(Out.os(), "", PreserveAssemblyUseListOrder));
  else if (Force || !CheckBitcodeOutputToConsole(Out.os()))
    PM.addPass(BitcodeWriterPass(Out.os(), PreserveBitcodeUseListOrder));

  PM.run(*M, MAM);

  //M->print(Out.os(), nullptr, PreserveAssemblyUseListOrder);
  // Declare success.
  Out.keep();

  return 0;
}
