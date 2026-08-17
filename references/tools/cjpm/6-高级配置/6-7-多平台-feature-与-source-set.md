<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjpm.6-高级配置.6-7-多平台-feature-与-source-set" parent="tools.cjpm.6-高级配置" -->
# 6.7 多平台 feature 与 source-set

[← 6. 高级配置](index.md)

多平台构建在 1.1.3 中是实验特性，先配置 `[profile] experimental = true`，再用 `[[feature]]` 和 `[[source-set]]` 声明选择关系。构建时使用 `--enable-features=a,b`；`--no-feature-deduce` 可关闭从目标 triple 推导 `os.*` feature。

每个 source-set 源文件必须在 `package` 之前写与清单一致的 `features {...}` 指令；公共非产品源码集写 `@NonProduct features {}`。没有传出边的源码集自动视为产品源码集；也可显式写 `product = true`。feature/source-set 图必须无环，平台源码集可以合并公共源码集，反向依赖不成立。

`build`、`run` 和 `test` 接受 `--enable-features` / `--no-feature-deduce`。1.1.3 的 `cjpm check` 不接受这两个选项，多平台工程应以实际构建或测试作为类型与配对声明门禁。
