<!-- cj-doc kind="guide-index" level="4" id="tools.cjpm.6-高级配置" parent="tools.cjpm" -->
# 6. 高级配置

[← cjpm 项目管理](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [6.1 Profile 配置](6-1-profile-配置.md) | 每个键都会成为一个不带值的 cjpm 开关。 |
| [6.2 C 语言 FFI 集成](6-2-c-语言-ffi-集成.md) | 配置入口：`[ffi.c]`。 |
| [6.3 交叉编译（target）](6-3-交叉编译-target.md) | 配置入口：`[target.x86_64-unknown-linux-gnu]`。 |
| [6.4 构建脚本（build.cj）](6-4-构建脚本-build-cj.md) | 构建脚本必须固定命名为 `build.cj`，并与 `cjpm.toml` 同级；`cjpm init` 不会自动创建它。 |
| [6.5 包级别配置](6-5-包级别配置.md) | 配置入口：`[package]`。 |
| [6.6 组织名与中心仓依赖](6-6-组织名与中心仓依赖.md) | 用 `organization` 固化模块身份，并用 `org::name` 引用中心仓模块。 |
| [6.7 多平台 feature 与 source-set](6-7-多平台-feature-与-source-set.md) | 在实验模式下建立公共/平台源码集，并选择目标 feature。 |
