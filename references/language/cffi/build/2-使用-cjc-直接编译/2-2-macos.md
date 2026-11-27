<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.build.2-使用-cjc-直接编译.2-2-macos" parent="language.cffi.build.2-使用-cjc-直接编译" -->
# 2.2 macOS

[← 2. 使用 cjc 直接编译](index.md)

命令：`clang -shared -Wall -Wextra -Werror -fPIC -fstack-protector-all native.c -o libnative.dylib`。

```shell
# 编译 C 代码为动态库
clang -shared -Wall -Wextra -Werror -fPIC -fstack-protector-all native.c -o libnative.dylib

# 编译 C 代码为静态库
clang -c -Wall -Wextra -Werror -fstack-protector-all native.c -o native.o && ar rcs libnative.a native.o

# 编译仓颉代码并链接
cjc -L . -l native main.cj -o main

# 运行（动态库须确保在搜索路径上）
export DYLD_LIBRARY_PATH=.:$DYLD_LIBRARY_PATH
./main
```
