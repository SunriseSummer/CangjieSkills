<!-- cj-doc kind="guide-index" level="5" id="language.macro.build.3-使用-cjpm-构建-推荐" parent="language.macro.build" -->
# 3. 使用 cjpm 构建（推荐）

[← 宏包编译构建](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [3.1 项目结构](3-1-项目结构.md) | 代码展示 `my_project/` 的典型用法。 |
| [3.2 宏模块 cjpm.toml](3-2-宏模块-cjpm-toml.md) | 宏模块的 `cjpm.toml` 必须设置 `compile-option = "--compile-macro"`。 |
| [3.3 主项目 cjpm.toml](3-3-主项目-cjpm-toml.md) | 在主项目 `cjpm.toml` 中以本地路径依赖方式引用宏模块。 |
| [3.4 构建与运行](3-4-构建与运行.md) | 宏模块设置 `output-type = "static"` 与 `--compile-macro`，主项目通过路径依赖引用；`cjpm build/run` 自动按依赖顺序编译。 |
| [3.5 多宏模块项目结构](3-5-多宏模块项目结构.md) | 当项目包含多个宏模块时，可以组织为。 |
