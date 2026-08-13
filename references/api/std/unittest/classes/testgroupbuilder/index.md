<!-- cj-doc kind="api-type" level="5" id="std.unittest.class.testgroupbuilder" parent="std.unittest" -->
# TestGroupBuilder

[← std.unittest](../../index.md)

`TestGroupBuilder`

提供配置测试组合的方法的构造器。

## 方法

| 签名 | 功能 |
|---|---|
| [`add(benchmark: Benchmark): TestGroupBuilder`](add.md) | 为测试组合增加性能测试用例。 |
| [`add(suite: TestSuite): TestGroupBuilder`](add.md) | 为测试组合增加单元测试套。 |
| [`add(test: UnitTestCase): TestGroupBuilder`](add.md) | 为测试组合增加单元测试用例。 |
| [`build(): TestGroup`](build.md) | 配置完成后，构建测试组合对象。 |
| [`configure(configuration: Configuration): TestGroupBuilder`](configure.md) | 为测试组合配置配置信息。 |
| [`setName(name: String): TestGroupBuilder`](setname.md) | 为测试组合设置名称。 |
