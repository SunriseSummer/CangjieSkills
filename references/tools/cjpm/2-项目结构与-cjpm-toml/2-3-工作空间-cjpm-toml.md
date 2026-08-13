<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjpm.2-项目结构与-cjpm-toml.2-3-工作空间-cjpm-toml" parent="tools.cjpm.2-项目结构与-cjpm-toml" -->
# 2.3 工作空间 cjpm.toml

[← 2. 项目结构与 cjpm.toml](index.md)

```toml
[workspace]
  members = ["app", "libs/core", "libs/util"]
  compile-option = ""
  link-option = ""
```

> **注意**：`[package]` 与 `[workspace]` 互斥，不可同时使用。

**[workspace] 关键字段：**

| 字段 | 说明 |
|------|------|
| `members` | 成员模块路径列表（必填） |
| `build-members` | 参与编译的成员子集 |
| `test-members` | 参与测试的成员子集（须为 build-members 子集） |
| `compile-option` | 全局编译选项 |
| `link-option` | 全局链接选项 |
| `target-dir` | 全局输出目录 |
