<!-- cj-doc kind="guide-index" level="5" id="language.cffi.build.4-完整示例" parent="language.cffi.build" -->
# 4. 完整示例

[← C互操作配置构建](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [4.1 Linux 完整编译流程](4-1-linux-完整编译流程.md) | 命令：`clang -shared -Wall -Wextra -Werror -fPIC -fstack-protector-all native.c -o libnative.so`。 |
| [4.2 Windows 完整编译流程](4-2-windows-完整编译流程.md) | 先用 `clang -shared -Wall -Wextra -Werror -fstack-protector-all` 独立构建 C；Windows cjpm 链接使用 `libnative.dll`，运行期同时放置 `native.dll`。 |
