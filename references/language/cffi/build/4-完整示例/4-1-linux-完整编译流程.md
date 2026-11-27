<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.build.4-完整示例.4-1-linux-完整编译流程" parent="language.cffi.build.4-完整示例" -->
# 4.1 Linux 完整编译流程

[← 4. 完整示例](index.md)

命令：`clang -shared -Wall -Wextra -Werror -fPIC -fstack-protector-all native.c -o libnative.so`。

```shell
# 1. 编写 C 代码 (native.c)
# 2. 编译 C 代码为动态库
clang -shared -Wall -Wextra -Werror -fPIC -fstack-protector-all native.c -o libnative.so

# 3. 使用 cjc 直接编译
cjc -L . -l native main.cj -o main
./main

# 或使用 cjpm 项目编译
# 将 libnative.so 放到 libs/ 目录下
# 在 cjpm.toml 中配置 [ffi.c] native = { path = "./libs/" }
cjpm build && cjpm run
```
