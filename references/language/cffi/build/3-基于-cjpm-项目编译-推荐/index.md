<!-- cj-doc kind="guide-index" level="5" id="language.cffi.build.3-基于-cjpm-项目编译-推荐" parent="language.cffi.build" -->
# 3. 基于 cjpm 项目编译（推荐）

[← C互操作配置构建](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [3.1 项目初始化](3-1-项目初始化.md) | 命令：`cjpm init`。 |
| [3.2 cjpm.toml 配置](3-2-cjpm-toml-配置.md) | 在 `cjpm.toml` 中通过 `[ffi.c]` 节配置 C 库依赖。 |
| [3.3 构建与运行](3-3-构建与运行.md) | 命令：`cjpm build`。 |
| [3.4 其他相关 cjpm.toml 配置项](3-4-其他相关-cjpm-toml-配置项.md) | 速查`output-type`：输出类型；`compile-option`：传给 `cjc` 的额外编译选项；`link-option`：传给链接器的选项。 |
| [3.5 不同平台的 cjpm.toml 配置](3-5-不同平台的-cjpm-toml-配置.md) | 当需要区分不同目标平台的库路径时，可使用 `[target]` 节。 |
| [3.6 链接安全加固选项](3-6-链接安全加固选项.md) | 对于需要安全加固的项目，建议在 `link-option` 中添加链接器安全标志。 |
