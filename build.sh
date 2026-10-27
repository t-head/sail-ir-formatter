#!/bin/bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BUILD_TYPE=Release
BUILD_DIR=build
ENABLE_ASSERT=Off

while [[ -n $1 ]];
do
    case "$1" in
        dbg)                BUILD_TYPE=Debug;;
        rel_with_dbg_info)  BUILD_TYPE=RelWithDebInfo;;
        assert_on)          ENABLE_ASSERT=On;;
        --output_dir | -o)  shift
            BUILD_DIR=$1;;
        clean)  echo remove build folder...
            rm -rf $BUILD_DIR
            exit 0;;
        rebuild)
            rm -rf $BUILD_DIR
    esac
    shift
done

if [ ! -d $BASEDIR/$BUILD_DIR ]
then
    rm -rf $BUILD_DIR && mkdir $BUILD_DIR && cd $BUILD_DIR
    cmake -G Ninja -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -DLLVM_ENABLE_ASSERTIONS=${ENABLE_ASSERT}  \
    -DLLVM_ENABLE_TERMINFO=OFF \
    ../llvm -DLLVM_ENABLE_PROJECTS="llvm" -DCMAKE_INSTALL_PREFIX="./output" \
    && ninja \
    && ./bin/llvm-lit ${BASEDIR}/llvm/test/tools/sail-irformatter/
else
    cd $BUILD_DIR
    cmake -G Ninja -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -DLLVM_ENABLE_ASSERTIONS=${ENABLE_ASSERT}  \
    -DLLVM_ENABLE_TERMINFO=OFF \
    ../llvm -DLLVM_ENABLE_PROJECTS="llvm" -DCMAKE_INSTALL_PREFIX="./output" \
    && ninja \
    && ./bin/llvm-lit ${BASEDIR}/llvm/test/tools/sail-irformatter/
fi

if [ $? -ne 0 ]
then
    echo "FAIL!"
    exit 1
else
    echo "SUCCESS!"
fi
