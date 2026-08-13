<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.testsuite.runbenchmarks" parent="std.unittest.class.testsuite" -->
# TestSuite.runBenchmarks

[← TestSuite](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func runBenchmarks()

### 签名

```cangjie role=signature
public func runBenchmarks(): BenchReport
```

运行所有性能测试用例。

### 契约

返回值：

- BenchReport - 性能测试运行结果。

## func runBenchmarks(Configuration)

### 签名

```cangjie role=signature
public func runBenchmarks(configuration: Configuration): BenchReport
```

带配置信息得运行所有性能测试用例。

### 契约

参数：

- configuration: Configuration - 运行配置信息。

返回值：

- BenchReport - 性能测试用例运行结果。
