<!-- cj-doc kind="api-type" level="5" id="std.unittest.class.testgroup" parent="std.unittest" -->
# TestGroup

[← std.unittest](../../index.md)

`TestGroup`

提供构建和运行测试组合方法的类。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`name: String`](prop-name.md) | 获取测试组合名称。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`runBenchmarks(): BenchReport`](runbenchmarks.md) | 运行所有性能测试用例。 |
| [`runBenchmarks(Configuration): BenchReport`](runbenchmarks.md) | 带运行配置得执行所有性能测试用例。 |
| [`runTests(): TestReport`](runtests.md) | 执行所有单元测试用例。 |
| [`runTests(configuration: Configuration): TestReport`](runtests.md) | 带运行配置得执行所有单元测试用例。 |
| [`static builder(name: String): TestGroupBuilder`](builder.md) | 创建测试组合构造器。 |
| [`static builder(group: TestGroup): TestGroupBuilder`](builder.md) | 创建测试组合构造器。 |
