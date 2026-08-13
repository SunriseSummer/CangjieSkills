<!-- cj-doc kind="guide-index" level="4" id="tools.cjpm.3-常用命令选项表" parent="tools.cjpm" -->
# 3. 常用命令选项表

[← cjpm 项目管理](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [3.1 build 选项](3-1-build-选项.md) | 速查`-i, --incremental`：增量编译；`-j, --jobs <N>`：并行编译线程数（上限 2×CPU 核数）；`-g`：生成调试版本；另含更多表项。 |
| [3.2 run 选项](3-2-run-选项.md) | `cjpm run --run-args="..."` 转发参数，但 1.0.5 会把单个实参中的 `=` 拆成两个实参；OptionalValue 的 `--opt=value` 应改用短附着形式或直接运行构建产物。Windows 上 cjpm 还不透传程序非零状态。 |
| [3.3 test 选项](3-3-test-选项.md) | `cjpm test` 在 `src` 包源码目录（package source directory）中发现 `@Test`/`@TestCase`；没有测试声明时可成功但显示 `TOTAL: 0`。 |
| [3.4 依赖检查与锁文件](3-4-依赖检查与锁文件.md) | `cjpm build` 会创建 `cjpm.lock`，后续构建使用其中锁定的传递依赖版本。 |
| [3.5 查看依赖树](3-5-查看依赖树.md) | 命令：`cjpm tree`。 |
| [3.6 安装与卸载](3-6-安装与卸载.md) | `install` 只接受 `executable` 产物。 |
