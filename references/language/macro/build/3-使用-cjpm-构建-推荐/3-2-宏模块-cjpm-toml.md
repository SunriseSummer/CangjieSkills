<!-- cj-doc kind="guide-leaf" level="6" id="language.macro.build.3-使用-cjpm-构建-推荐.3-2-宏模块-cjpm-toml" parent="language.macro.build.3-使用-cjpm-构建-推荐" -->
# 3.2 宏模块 cjpm.toml

[← 3. 使用 cjpm 构建（推荐）](index.md)

宏模块的 `cjpm.toml` 必须设置 `compile-option = "--compile-macro"`：

```toml
[package]
cjc-version = "1.1.3"
name = "macros"
version = "1.0.0"
output-type = "static"
compile-option = "--compile-macro"
```
