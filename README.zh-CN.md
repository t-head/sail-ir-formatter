# Sail IR Formatter

[English](README.md) | 简体中文

一个命令行工具，用于将 opaque pointers 转换为 typed pointers，并改写 `memory(...)` attributes，以兼容旧版 LLVM toolchains。

例如，[triton-for-sail](https://github.com/t-head/triton-for-sail/blob/235464c50eb706e09b981198c1117b5a5e6c91b2/third_party/ppu/backend/compiler.py#L471) 使用该工具处理 LLVM IR，为 PPU code generation 做准备。

## 构建

在仓库根目录运行：

```sh
./build.sh
```

该脚本以 Release 模式构建所有默认目标，并运行格式转换工具的测试。生成的可执行文件为 `build/bin/sail-irformatter`，无需单独安装 LLVM。

## 使用方法

输出转换后的textual IR：

```sh
build/bin/sail-irformatter -S input.ll -o output.ll
```

省略 `-S` 时，无论输出文件的扩展名是什么，都会输出 **bitcode**：

```sh
build/bin/sail-irformatter input.ll -o output.bc
```

输入支持textual IR 和兼容的 bitcode。默认从标准输入读取并写入标准输出，也可以用 `-` 显式指定：

```sh
build/bin/sail-irformatter -S < input.ll > output.ll
```

| 选项 | 默认值 | 说明 |
| --- | --- | --- |
| `-S` | 关闭 | 输出textual IR，而非 bitcode |
| `-o <filename>` | `-` | 输出文件；`-` 表示标准输出 |
| `--type-pointers=<bool>` | `true` | 转换 pointers 并进行相关兼容性处理 |
| `--trans-memory-attributes=<bool>` | `true` | 将 `memory(...)` 转换为 legacy attributes |
| `--verify-pointers` | 关闭 | 检查是否仍有 opaque pointers；不执行完整的 IR verification |
| `-f` | 关闭 | 允许向终端输出二进制内容 |

使用 `=false` 可禁用 boolean 选项。`--help-hidden` 会显示 `--help` 中未列出的 `-S` 及 use-list order 相关选项。

转换过程可能丢弃不受支持的信息，请务必使用目标 toolchain 验证输出。

## 测试

`./build.sh` 会自动运行格式转换工具的测试。构建完成后，可以用以下命令重新运行：

```sh
build/bin/llvm-lit -v llvm/test/tools/sail-irformatter
```

测试覆盖 pointers、attributes 及 syntax compatibility，包括 `llvm18_dev/` 和 `mlirTrans/` 中的用例。后者包含的是 LLVM IR，而非 MLIR 文本。

## 源码结构

| 路径 | 用途 |
| --- | --- |
| [`llvm/tools/sail-irformatter/`](llvm/tools/sail-irformatter/) | CLI 与 conversion pipeline |
| [`TypingPointers.cpp`](llvm/lib/Transforms/Utils/TypingPointers.cpp) | pointers 转换与检查 |
| [`TransMemoryAttr.cpp`](llvm/lib/Transforms/Utils/TransMemoryAttr.cpp) | memory attributes 转换 |
| [`llvm/lib/AsmParser/`](llvm/lib/AsmParser/) | 解析与 syntax compatibility 处理 |
| [`AutoUpgrade.cpp`](llvm/lib/IR/AutoUpgrade.cpp) | intrinsic 兼容性处理 |
| [`llvm/test/tools/sail-irformatter/`](llvm/test/tools/sail-irformatter/) | 回归测试 |
