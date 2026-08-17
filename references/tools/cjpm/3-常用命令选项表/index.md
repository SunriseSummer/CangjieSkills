<!-- cj-doc kind="guide-index" level="4" id="tools.cjpm.3-常用命令选项表" parent="tools.cjpm" -->
# 3. 常用命令选项表

[← cjpm 项目管理](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [3.1 build 选项](3-1-build-选项.md) | 速查`-i, --incremental`：增量编译；`-j, --jobs <N>`：并行编译线程数（上限 2×CPU 核数）；`-g`：生成调试版本；另含更多表项。 |
| [3.2 run 选项](3-2-run-选项.md) | 1.1.3 推荐 `cjpm run -- <args...>`；旧 `--run-args` 会拆分 `=` 且已提示未来移除。Windows 上 cjpm 仍不透传程序非零状态。 |
| [3.3 test 选项](3-3-test-选项.md) | `cjpm test` 在 `src` 包源码目录（package source directory）中发现 `@Test`/`@TestCase`；没有测试声明时可成功但显示 `TOTAL: 0`。 |
| [3.4 依赖检查与锁文件](3-4-依赖检查与锁文件.md) | `cjpm build` 会创建 `cjpm.lock`，后续构建使用其中锁定的传递依赖版本。 |
| [3.5 查看依赖树](3-5-查看依赖树.md) | 命令：`cjpm tree`。 |
| [3.6 安装与卸载](3-6-安装与卸载.md) | `install` 只接受 `executable` 产物。 |
