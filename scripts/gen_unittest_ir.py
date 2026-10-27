import os
from pathlib import Path
import subprocess
import re

openSourceLLVM="/ppuswhome/xiao.han/opensource/llvm-project"
binDir=os.path.join(openSourceLLVM, "build-release-mlir/bin")

mlirBaseDir="/ppuswhome/xiao.han/opensource/llvm-project/mlir/test"

baseDir = os.path.dirname(__file__)
irDir = Path(baseDir) / "mlirTrans"
irDir.mkdir(parents=True, exist_ok=True)

caseSuite={
"Dialect/LLVMIR/call-intrin.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file -verify-diagnostics"],
"Dialect/LLVMIR/calling-conventions.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
#"Dialect/LLVMIR/di-expression-legalization.mlir" : ["mlir-translate -mlir-to-llvmir --split-input-file"],
"Dialect/LLVMIR/func.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file -verify-diagnostics"],
"Dialect/LLVMIR/tail-call-kinds.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Dialect/Vector/vector-rewrite-narrow-types.mlir" : ["mlir-opt --transform-interpreter -test-transform-dialect-erase-schedule -test-lower-to-llvm", "mlir-translate -mlir-to-llvmir "],
"Target/LLVMIR/amx.mlir" : ["mlir-translate --mlir-to-llvmir"],
"Target/LLVMIR/gpu.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/llvmir-types.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/openmp-private.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/omptarget-byref-bycopy-generation-host.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/opaque-ptr.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/vscale.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/arm-neon.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
#"Target/LLVMIR/arm-sme.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/openmp-reduction.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/omptarget-llvm.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/data-layout.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file -verify-diagnostics"],
"Target/LLVMIR/frame-pointer.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/llvmir-le-specific.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/loop-metadata.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/nsw_nuw.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/vector-to-llvm-ir.mlir" : ["mlir-opt -pass-pipeline=\"builtin.module(convert-vector-to-llvm,func.func(convert-arith-to-llvm),convert-func-to-llvm,reconcile-unrealized-casts)\"", "mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/x86vector.mlir" : ["mlir-translate --mlir-to-llvmir"],
"Target/LLVMIR/nvvmir.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file --verify-diagnostics"],
"Target/LLVMIR/target-cpu.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/attribute-tbaa.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/external-func-dialect-attr.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/vcix-rv32.mlir" : ["mlir-translate --split-input-file --mlir-to-llvmir"],
"Target/LLVMIR/vcix-rv64.mlir" : ["mlir-translate --mlir-to-llvmir"],
#"Target/LLVMIR/arm-sve.mlir" : ["mlir-translate --mlir-to-llvmir"],
"Target/LLVMIR/fp-math-function-attributes.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
#"Target/LLVMIR/llvmir-debug.mlir" : ["mlir-translate -mlir-to-llvmir --write-experimental-debuginfo=false --split-input-file"],
#"Target/LLVMIR/llvmir-debug.mlir" : ["mlir-translate -mlir-to-llvmir --write-experimental-debuginfo=true --split-input-file"],
#"Target/LLVMIR/llvmir-intrinsics.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/openacc-llvm.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/openmp-llvm-invalid.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file -verify-diagnostics"],
"Target/LLVMIR/target-ext-type.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/attribute-alias-scopes.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/omptarget-array-sectioning-host.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-byref-bycopy-generation-device.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/openmp-llvm.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/openmp-nested.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/omptarget-declare-target-llvm-device.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-declare-target-llvm-host.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/rocdl.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-region-device-llvm.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-region-llvm.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-region-parallel-llvm.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-target-cpu-features.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-target-inside-task.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-teams-llvm.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/openmp-firstprivate.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/openmp-reduction-call.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/openmp-task-target-device.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/openmp-teams.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/target-features.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/llvmir.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/omptarget-constant-alloca-raise.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-constant-indexing-device-region.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-fortran-allocatable-types-host.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-fortran-common-block-host.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-nested-record-type-mapping-host.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-parallel-llvm.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-parallel-wsloop.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-record-type-mapping-host.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-wsloop-collapsed.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptarget-wsloop.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/omptask_if_false.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/openmp-data-target-device.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/openmp-omp.private-dealloc.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/openmp-parallel-reduction-cleanup.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/openmp-parallel-reduction-multiblock.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/openmp-reduction-byref.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],
"Target/LLVMIR/openmp-reduction-init-arg.mlir" : ["mlir-translate -mlir-to-llvmir"],
"Target/LLVMIR/openmp-wsloop-reduction-cleanup.mlir" : ["mlir-translate -mlir-to-llvmir -split-input-file"],

}

def insert_callback(match):
    return "\n; CHECK-LABLE: " + match.group(1) + match.group()

for caseName in caseSuite:
    #print(caseName)
    mlirName = caseName.split('/')[-1]
    #print(mlirName)
    llirName = mlirName.rstrip("mlir") + "ll"
    llirFile = os.path.join(irDir, llirName)
    mlirFile = os.path.join(mlirBaseDir, caseName)
    #print(llirFile)
    env = os.environ.copy()
    env["PATH"] = binDir + ":" + env["PATH"]
    cmdNum = len(caseSuite[caseName])
    #print(cmdNum)
    inFile = mlirFile
    outFile = llirFile
    for i in range(cmdNum):
        if i == cmdNum-1:
            outFile = llirFile
        else:
            outFile = outFile + ".tmp"
        cmd = binDir + "/" + caseSuite[caseName][i] + " " + inFile + " -o " + outFile
        print(cmd)
        if subprocess.run(cmd, shell=True).returncode != 0:
            print("Failed!")
            break
        if inFile != mlirFile:
            print("rm " + inFile)
            subprocess.run("rm " + inFile, shell=True)
        inFile = outFile
        print("Success!")
    with open(outFile, "r+") as f:
        content = f.read()
        cmd = "; RUN: sail-irformatter -S -verify-pointers < %s\n\n"
        #clcontent = re.sub("\ndefine.*@(.*)\(", insert_callback, content)
        #cmd = "; RUN: sail-irformatter -S -verify-pointers < %s | FileCheck %s\n\n"
        i = 0

        for mct in re.split("; ModuleID = \'LLVMDialectModule\'", content):
            if mct == '':
                continue
            newOutFile = outFile.rstrip("\.ll") + "-" + str(i) + ".ll"
            i = i+1
            with open(newOutFile, "w+") as of:
                of.seek(0)
                of.write(cmd)
                of.write("; ModuleID = \'LLVMDialectModule\'")
                of.write(mct)
    subprocess.run("rm " + outFile, shell=True)



