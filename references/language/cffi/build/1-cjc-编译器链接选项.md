<!-- cj-doc kind="guide-leaf" level="5" id="language.cffi.build.1-cjc-编译器链接选项" parent="language.cffi.build" -->
# 1. cjc 编译器链接选项

[← C互操作配置构建](index.md)

速查`-L <path>` / `--library-path <path>`：指定库文件搜索目录（优先级高于 `LIBRARY_PATH` 环境变量）；`-l <name>` / `--library <name>`：链接库文件，格式为 `lib[name].[extension]`（如 `-l draw` 链接 `libdraw.so/.a/.dll`）。

| 选项 | 说明 |
|------|------|
| `-L <path>` / `--library-path <path>` | 指定库文件搜索目录（优先级高于 `LIBRARY_PATH` 环境变量） |
| `-l <name>` / `--library <name>` | 链接库文件，格式为 `lib[name].[extension]`（如 `-l draw` 链接 `libdraw.so/.a/.dll`） |

---
