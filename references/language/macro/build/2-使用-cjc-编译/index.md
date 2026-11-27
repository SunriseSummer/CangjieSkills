<!-- cj-doc kind="guide-index" level="5" id="language.macro.build.2-使用-cjc-编译" parent="language.macro.build" -->
# 2. 使用 cjc 编译

[← 宏包编译构建](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [概述与共同规则](overview.md) | 宏包须先编译，使用 `--compile-macro` 标志，然后编译调用包并链接宏包。 |
| [2.1 基本编译流程](2-1-基本编译流程.md) | 命令：`cjc macros/m.cj --compile-macro --output-dir ./target`。 |
| [2.2 多模块场景](2-2-多模块场景.md) | 当宏包依赖其他非宏包时，须按依赖顺序编译。 |
| [2.3 不同平台的注意事项](2-3-不同平台的注意事项.md) | 速查`Linux`：`.so`；`macOS`：`.dylib`；`Windows`：`.dll`。 |
