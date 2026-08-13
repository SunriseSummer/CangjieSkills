<!-- cj-doc kind="guide-index" level="4" id="tools.cjpm.2-项目结构与-cjpm-toml" parent="tools.cjpm" -->
# 2. 项目结构与 cjpm.toml

[← cjpm 项目管理](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [2.1 目录结构](2-1-目录结构.md) | 代码展示 `myapp/` 的典型用法。 |
| [2.2 基本 cjpm.toml（单模块）](2-2-基本-cjpm-toml-单模块.md) | 单模块 `cjpm.toml` 的 `[package]` 至少给出非空 `cjc-version = "1.0.5"`、`name`、`version` 和 `output-type`；可执行项目使用 `output-type = "executable"`。 |
| [2.3 工作空间 cjpm.toml](2-3-工作空间-cjpm-toml.md) | 注意：`[package]` 与 `[workspace]` 互斥，不可同时使用。 |
| [2.4 示例主程序](2-4-示例主程序.md) | 提供可独立构建的示例，演示示例主程序。 |
