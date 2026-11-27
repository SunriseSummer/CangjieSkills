<!-- cj-doc kind="guide-index" level="4" id="language.cffi.build" parent="language.cffi" -->
# C互操作配置构建

[← C 互操作](../index.md)

| 规则/任务 | 摘要 |
|---|---|
| [0. 各平台库文件命名对照](0-各平台库文件命名对照.md) | 注意：Windows 平台上依赖动态库，目前 cjc 和 cjpm 实现有差异：编译时，cjc 对动态库是否有`lib`前缀不敏感，cjpm 则要求动态库必须有`lib`前缀。 |
| [1. cjc 编译器链接选项](1-cjc-编译器链接选项.md) | 速查`-L <path>` / `--library-path <path>`：`-L <path>`、`--library-path <path>`、`LIBRARY_PATH` 等（共 8 项）。 |
| [2. 使用 cjc 直接编译](2-使用-cjc-直接编译/index.md) | 注意：Windows 平台上 C 函数需使用 `declspec(dllexport)` 修饰以导出符号。 |
| [3. 基于 cjpm 项目编译（推荐）](3-基于-cjpm-项目编译-推荐/index.md) | 在 `cjpm.toml` 中通过 `[ffi.c]` 节配置 C 库依赖。 |
| [4. 完整示例](4-完整示例/index.md) | 子页分别说明Linux 完整编译流程、Windows 完整编译流程。 |
