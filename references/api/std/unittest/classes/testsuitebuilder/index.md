<!-- cj-doc kind="api-type" level="5" id="std.unittest.class.testsuitebuilder" parent="std.unittest" -->
# TestSuiteBuilder

[← std.unittest](../../index.md)

`TestSuiteBuilder`

提供配置测试套方法的测试套构造器。

## 方法

| 签名 | 功能 |
|---|---|
| [`add(benchmark: Benchmark): TestSuiteBuilder`](add.md) | 为测试套添加性能用例。 |
| [`add(test: UnitTestCase): TestSuiteBuilder`](add.md) | 为测试套添加单元测试用例。 |
| [`afterAll(body: () -> Unit): TestSuiteBuilder`](afterall.md) | 为测试套添加在所有用例执行完成后执行的生命周期管理闭包。 |
| [`afterEach(body: () -> Unit): TestSuiteBuilder`](aftereach.md) | 为测试套添加在每个用例执行完成后执行的生命周期管理闭包。 |
| [`afterEach(body: (String) -> Unit): TestSuiteBuilder`](aftereach.md) | 为测试套添加在每个用例执行完成后执行的生命周期管理闭包。 |
| [`beforeAll(body: () -> Unit): TestSuiteBuilder`](beforeall.md) | 为测试套添加在所有用例执行前执行的生命周期管理闭包。 |
| [`beforeEach(body: () -> Unit): TestSuiteBuilder`](beforeeach.md) | 为测试套添加在每个用例执行前执行的生命周期管理闭包。 |
| [`beforeEach(body: (String) -> Unit): TestSuiteBuilder`](beforeeach.md) | 为测试套添加在每个用例执行前执行的生命周期管理闭包。 |
| [`template(template: TestSuite): TestSuiteBuilder`](template.md) | 执行此方法可为测试套件设置模板。 |
| [`build(): TestSuite`](build.md) | 配置完成后构造测试套。 |
| [`configure(configuration: Configuration): TestSuiteBuilder`](configure.md) | 为测试套添加配置信息。 |
| [`setName(name: String): TestSuiteBuilder`](setname.md) | 为测试套设置名称。 |
