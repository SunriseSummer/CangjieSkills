<!-- cj-doc kind="api-type" level="5" id="std.unittest.class.testsuite" parent="std.unittest" -->
# TestSuite

[← std.unittest](../../index.md)

`TestSuite`

提供构建和执行测试套方法的类。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`name: String`](prop-name.md) | 获取测试套名称。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`runBenchmarks(): BenchReport`](runbenchmarks.md) | 运行所有性能测试用例。 |
| [`runBenchmarks(configuration: Configuration): BenchReport`](runbenchmarks.md) | 带配置信息得运行所有性能测试用例。 |
| [`runTests(): TestReport`](runtests.md) | 运行测试套。 |
| [`runTests(configuration: Configuration): TestReport`](runtests.md) | 带配置信息得运行测试套。 |
| [`static builder(name: String): TestSuiteBuilder`](builder.md) | 创建测试套构建器。 |
| [`static builder(suite: TestSuite): TestSuiteBuilder`](builder.md) | 创建测试套构建器。 |
