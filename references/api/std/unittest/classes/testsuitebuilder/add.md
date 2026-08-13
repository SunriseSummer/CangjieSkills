<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.testsuitebuilder.add" parent="std.unittest.class.testsuitebuilder" -->
# TestSuiteBuilder.add

[← TestSuiteBuilder](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func add(Benchmark)

### 签名

```cangjie role=signature
public func add(benchmark: Benchmark): TestSuiteBuilder
```

为测试套添加性能用例。

### 契约

参数：

- benchmark: Benchmark - 性能测试用例。

返回值：

- TestSuiteBuilder - 测试组合构造器。

## func add(UnitTestCase)

### 签名

```cangjie role=signature
public func add(test: UnitTestCase): TestSuiteBuilder
```

为测试套添加单元测试用例。

### 契约

参数：

- test: UnitTestCase - 单元测试用例。

返回值：

- TestSuiteBuilder - 测试组合构造器。
