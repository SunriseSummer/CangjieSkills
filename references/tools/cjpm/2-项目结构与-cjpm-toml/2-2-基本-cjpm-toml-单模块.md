<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjpm.2-项目结构与-cjpm-toml.2-2-基本-cjpm-toml-单模块" parent="tools.cjpm.2-项目结构与-cjpm-toml" -->
# 2.2 基本 cjpm.toml（单模块）

[← 2. 项目结构与 cjpm.toml](index.md)

单模块 `cjpm.toml` 的 `[package]` 至少给出非空 `cjc-version = "1.0.5"`、`name`、`version` 和 `output-type`；可执行项目使用 `output-type = "executable"`。

```toml
[package]
  cjc-version = "1.0.5"
  name = "myapp"
  version = "1.0.0"
  output-type = "executable"

[dependencies]
  mylib = { path = "./libs/mylib" }
```

**[package] 关键字段：**

| 字段 | 说明 |
|------|------|
| `cjc-version` | 最低 cjc 版本要求（必填） |
| `name` | 模块名 / 根包名（必填） |
| `version` | 模块版本号（必填） |
| `output-type` | `"executable"` / `"static"` / `"dynamic"`（必填） |
| `compile-option` | 额外编译选项 |
| `link-option` | 透传链接器选项 |
| `src-dir` | 源码目录路径 |
| `target-dir` | 输出目录路径 |

## 可直接重建的完整项目

```toml cjtest=project id=tools.cjpm.project-minimal file=cjpm.toml command=run timeout=60s
[package]
cjc-version = "1.0.5"
name = "cjdoc_project"
version = "0.1.0"
output-type = "executable"
```

```cangjie cjtest=file project=tools.cjpm.project-minimal file=src/main.cj
package cjdoc_project

main(): Unit {
    println("project-ok")
}
```

```text cjtest=expect for=tools.cjpm.project-minimal stream=stdout match=exact
project-ok
```
