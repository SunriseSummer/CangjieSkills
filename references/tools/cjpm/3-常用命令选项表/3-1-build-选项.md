<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjpm.3-常用命令选项表.3-1-build-选项" parent="tools.cjpm.3-常用命令选项表" -->
# 3.1 build 选项

[← 3. 常用命令选项表](index.md)

速查`-i, --incremental`：增量编译；`-j, --jobs <N>`：并行编译线程数（上限 2×CPU 核数）；`-g`：生成调试版本；另含更多表项。

| 选项 | 说明 |
|------|------|
| `-i, --incremental` | 增量编译 |
| `-j, --jobs <N>` | 并行编译线程数（上限 2×CPU 核数） |
| `-g` | 生成调试版本 |
| `-V, --verbose` | 显示编译详情 |
| `--coverage` | 启用覆盖率插桩 |
| `--cfg` | 启用 `[profile.customized-option]` 中名为 `cfg` 的透传项；它是不带值的开关 |
| `-m, --member <value>` | 指定工作空间成员 |
| `--target <value>` | 交叉编译目标平台 |
| `--target-dir <value>` | 指定输出目录 |
| `-o, --output <value>` | 指定可执行文件名（默认 `main`） |
| `-l, --lint` | 启用 cjlint 代码检查 |
| `--mock` | 启用 mock 功能 |
| `--skip-script` | 跳过 build.cj 脚本执行 |
