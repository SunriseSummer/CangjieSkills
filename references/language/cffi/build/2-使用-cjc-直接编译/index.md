<!-- cj-doc kind="guide-index" level="5" id="language.cffi.build.2-使用-cjc-直接编译" parent="language.cffi.build" -->
# 2. 使用 cjc 直接编译

[← C互操作配置构建](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [2.1 Linux](2-1-linux.md) | 命令：`clang -shared -Wall -Wextra -Werror -fPIC -fstack-protector-all native.c -o libnative.so`。 |
| [2.2 macOS](2-2-macos.md) | 命令：`clang -shared -Wall -Wextra -Werror -fPIC -fstack-protector-all native.c -o libnative.dylib`。 |
| [2.3 Windows](2-3-windows.md) | 注意：Windows 平台上 C 函数需使用 `declspec(dllexport)` 修饰以导出符号。 |
| [2.4 安全编译建议](2-4-安全编译建议.md) | `cjpm build` 只链接 `[ffi.c]` 指向的现成库，不会替代 C 源码编译。 |
