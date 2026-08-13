<!-- cj-doc kind="api-type" level="5" id="std.unittest.class.testpackage" parent="std.unittest" -->
# TestPackage

[← std.unittest](../../index.md)

`TestPackage`

用例包对象。

## 方法

| 签名 | 功能 |
|---|---|
| [`TestPackage(let name: String)`](testpackage-string.md) | TestPackage 构造函数。 |
| [`registerCase(testCase: () -> UnitTestCase): Unit`](registercase.md) | 注册单元测试用例。 |
| [`registerSuite(suite: () -> TestSuite): Unit`](registersuite.md) | 注册测试套。 |
| [`registerBench(bench: () -> Benchmark): Unit`](registerbench.md) | 注册性能用例。 |
| [`enableOptimizedMockForBench(): Unit`](enableoptimizedmockforbench.md) | 启用优化以在测试中同时使用模拟和基准测试。 |
