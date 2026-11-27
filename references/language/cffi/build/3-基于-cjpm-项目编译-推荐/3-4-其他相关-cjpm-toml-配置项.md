<!-- cj-doc kind="guide-leaf" level="6" id="language.cffi.build.3-基于-cjpm-项目编译-推荐.3-4-其他相关-cjpm-toml-配置项" parent="language.cffi.build.3-基于-cjpm-项目编译-推荐" -->
# 3.4 其他相关 cjpm.toml 配置项

[← 3. 基于 cjpm 项目编译（推荐）](index.md)

速查`output-type`：输出类型；`compile-option`：传给 `cjc` 的额外编译选项；`link-option`：传给链接器的选项。

| 配置项 | 说明 | 示例 |
|--------|------|------|
| `output-type` | 输出类型 | `"executable"` / `"static"` / `"dynamic"` |
| `compile-option` | 传给 `cjc` 的额外编译选项 | `"-O1"` |
| `link-option` | 传给链接器的选项 | `"-z noexecstack -z relro -z now"` |
