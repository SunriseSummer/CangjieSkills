<!-- cj-doc kind="guide-index" level="4" id="tools.cjc.2-核心选项速查" parent="tools.cjc" -->
# 2. 核心选项速查

[← cjc 编译器](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [2.1 输出控制](2-1-输出控制.md) | 命令：`cjc tool.cj --output-type=dylib`。 |
| [2.2 包与模块](2-2-包与模块.md) | 命令：`cjc -p log --output-type=staticlib`。 |
| [2.3 链接](2-3-链接.md) | 注意：`--dy-std` 与 `--static-libs` 不可同时使用；`--static-std` 与 `--dy-libs` 不可同时使用。 |
| [2.4 调试与诊断](2-4-调试与诊断.md) | 速查`-g`：生成调试信息（须配合 `-O0`）；`-V`, `--verbose`：打印编译过程详细信息；`-v`, `--version`：打印编译器版本；另含更多表项。 |
| [2.5 测试](2-5-测试.md) | 命令：`cjc a.cj --test`。 |
| [2.6 宏](2-6-宏.md) | 命令：`cjc --compile-macro macro.cj`。 |
| [2.7 条件编译](2-7-条件编译.md) | 命令：`cjc main.cj --cfg "env=prod"`。 |
| [2.8 优化](2-8-优化.md) | 命令：`cjc test.cj --lto=full`。 |
| [2.9 覆盖率与性能分析](2-9-覆盖率与性能分析.md) | 命令：`cjc --coverage main.cj`。 |
| [2.10 交叉编译](2-10-交叉编译.md) | 命令：`cjc hello.cj --target=x86_64-windows-gnu`。 |
| [2.11 其他常用选项](2-11-其他常用选项.md) | 速查`--trimpath <prefix>`：移除调试信息中的路径前缀；`-s`, `--strip-all`：删除输出文件中的符号表；`--set-runtime-rpath`：写入运行时库路径到 RPATH；另含更多表项。 |
| [2.12 警告控制与零警告验收](2-12-警告控制与零警告验收.md) | `-Won` 与 `-Woff` 顺序敏感，同一警告组以后出现的选项为准。 |
| [2.13 实验性效应处理器](2-13-实验性效应处理器.md) | 1.1.3 同时使用 `--experimental --enable-eh` 启用 perform、handle 与 resume。 |
