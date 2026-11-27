<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.build.2-使用-cjc-直接编译.2-3-windows" parent="language.cffi.build.2-使用-cjc-直接编译" -->
# 2.3 Windows

[← 2. 使用 cjc 直接编译](index.md)

```shell
# 编译 C 代码为动态库（导出函数需加 __declspec(dllexport) 修饰）
clang -shared -Wall -Wextra -Werror -fstack-protector-all native.c -o libnative.dll

# 编译仓颉代码并链接
cjc -L . -l native main.cj -o main.exe

# 运行（动态库须确保在搜索路径上）
./main.exe
```

> **注意**：Windows 平台上 C 函数需使用 `__declspec(dllexport)` 修饰以导出符号。
