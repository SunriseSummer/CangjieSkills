<!-- cj-doc kind="guide-topic" level="3" id="tools.cjc" parent="tools" -->
# cjc 编译器

[← 工具链](../index.md)

源码和包编译、输出类型、链接、调试、宏、条件编译、优化与交叉编译。

| 规则/任务 | 摘要 |
|---|---|
| [1. 基本用法](1-基本用法.md) | `cjc-frontend`：仅前端编译器，输出 LLVM IR（`.bc`） |
| [2. 核心选项速查](2-核心选项速查/index.md) | 注意：`--dy-std` 与 `--static-libs` 不可同时使用；`--static-std` 与 `--dy-libs` 不可同时使用。 |
| [3. 典型工作流](3-典型工作流.md) | 提示：多文件项目推荐使用 `cjpm`，无需手动管理编译依赖。 |
