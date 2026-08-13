<!-- cj-doc kind="guide-leaf" level="5" id="tools.cjpm.3-常用命令选项表.3-3-test-选项" parent="tools.cjpm.3-常用命令选项表" -->
# 3.3 test 选项

[← 3. 常用命令选项表](index.md)

`cjpm test` 在 `src` 包源码目录（package source directory）中发现 `@Test`/`@TestCase`；没有测试声明时可成功但显示 `TOTAL: 0`。

`cjpm test` 编译并运行带 `@Test` / `@TestCase` 等单元测试声明的源码。测试源码的文件名必须以 `_test.cj` 结尾，并与被测源码放在 `src/` 下的对应包目录；否则不会作为测试源码发现。没有测试声明时命令可成功但报告 `TOTAL: 0`。不带路径时只测试当前模块，不测试依赖模块；可传一个或多个包路径缩小范围。

| 选项 | 说明 |
|------|------|
| `-j, --jobs <N>` | 测试构建阶段并发启动的任务数 |
| `--no-run` | 只编译测试，不运行 |
| `--skip-build` | 跳过编译，只运行已有测试产物 |
| `--dry-run` | 列出将运行的测试，不执行 |
| `--filter <value>` | 过滤测试用例（通配符匹配，如 `*`/`*.*`/`*.*Test`） |
| `--include-tags <value>` | 只运行含指定标签的测试 |
| `--exclude-tags <value>` | 排除含指定标签的测试 |
| `--timeout-each <value>` | 单测超时，格式 `%d[millis\|s\|m\|h]` |
| `--parallel <value>` | 并行策略：`true`/`false`/`nCores`/`<N>` |
| `--random-seed <value>` | 随机种子（正整数） |
| `--show-tags` | 在文本报告中显示标签 |
| `--show-all-output` | 显示包括成功用例在内的全部捕获输出 |
| `--no-capture-output` | 不捕获测试输出，运行时立即打印 |
| `--no-color` | 禁用彩色输出 |
| `--report-path <value>` | 测试报告输出路径 |
| `--report-format <value>` | 报告格式（`xml`） |
| `--coverage` | 启用覆盖率统计 |
| `--cfg` | 启用 `[profile.customized-option]` 中名为 `cfg` 的透传项 |
| `--skip-script` | 跳过构建脚本 `build.cj` |
| `--no-progress` / `--progress-brief` | 关闭进度报告或使用简略进度 |

```bash
cjpm test                              # 运行全部测试
cjpm test src/utils                    # 测试指定包
cjpm test --filter "testAdd"           # 过滤指定测试用例
cjpm test --timeout-each 30s           # 设置单测超时 30 秒
cjpm test --parallel 4                 # 4 线程并行测试
cjpm test --no-run                     # 仅验证测试能否编译
cjpm test --dry-run --include-tags api # 预览带 api 标签的用例
```
