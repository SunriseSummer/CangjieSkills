<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.build.3-基于-cjpm-项目编译-推荐.3-2-cjpm-toml-配置" parent="language.cffi.build.3-基于-cjpm-项目编译-推荐" -->
# 3.2 cjpm.toml 配置

[← 3. 基于 cjpm 项目编译（推荐）](index.md)

在 `cjpm.toml` 中通过 `[ffi.c]` 节配置 C 库依赖：

```toml
[package]
  name = "myproject"
  cjc-version = "1.1.3"
  version = "1.0.0"
  output-type = "executable"

[ffi.c]
native = { path = "./libs/" }  # path 是 C 动态/静态库所在路径
```
