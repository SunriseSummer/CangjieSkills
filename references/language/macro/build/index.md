<!-- cj-doc kind="guide-index" level="4" id="language.macro.build" parent="language.macro" -->
# 宏包编译构建

[← 宏](../index.md)

| 规则/任务 | 摘要 |
|---|---|
| [1. 宏包编译规则](1-宏包编译规则/index.md) | 宏须在 `macro package` 声明的包中 |
| [2. 使用 cjc 编译](2-使用-cjc-编译/index.md) | 宏包须先编译，使用 `--compile-macro` 标志，然后编译调用包并链接宏包。 |
| [3. 使用 cjpm 构建（推荐）](3-使用-cjpm-构建-推荐/index.md) | 宏模块的 `cjpm.toml` 必须设置 `compile-option = "--compile-macro"`。 |
| [4. 并行宏展开](4-并行宏展开.md) | 使用 `--parallel-macro-expansion` 标志启用并行宏展开 |
| [5. 调试模式](5-调试模式.md) | `--debug-macro` 生成 `.macrocall` 临时文件显示完全展开的宏代码 |
| [6. 常见问题](6-常见问题/index.md) | 现象：编译调用包时报找不到宏定义 |
