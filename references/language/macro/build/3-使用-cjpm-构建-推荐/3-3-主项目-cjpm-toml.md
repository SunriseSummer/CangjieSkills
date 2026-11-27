<!-- cj-doc kind="guide-leaf" level="6" id="language.macro.build.3-使用-cjpm-构建-推荐.3-3-主项目-cjpm-toml" parent="language.macro.build.3-使用-cjpm-构建-推荐" -->
# 3.3 主项目 cjpm.toml

[← 3. 使用 cjpm 构建（推荐）](index.md)

在主项目 `cjpm.toml` 中以本地路径依赖方式引用宏模块：

```toml
[package]
cjc-version = "1.1.3"
name = "my_project"
version = "1.0.0"
output-type = "executable"

[dependencies]
macros = { path = "./macros" }
```
