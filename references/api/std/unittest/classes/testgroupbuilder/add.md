<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.testgroupbuilder.add" parent="std.unittest.class.testgroupbuilder" -->
# TestGroupBuilder.add

[← TestGroupBuilder](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## func add(Benchmark)

### 签名

```cangjie role=signature
public func add(benchmark: Benchmark): TestGroupBuilder
```

为测试组合增加性能测试用例。

### 契约

参数：

- benchmark: Benchmark - 性能测试用例。

返回值：

- TestGroupBuilder  - 测试组合构造器。

## func add(TestSuite)

### 签名

```cangjie role=signature
public func add(suite: TestSuite): TestGroupBuilder
```

为测试组合增加单元测试套。

### 契约

参数：

- suite: TestSuite - 单元测试套。

返回值：

- TestGroupBuilder  - 测试组合构造器。

## func add(UnitTestCase)

### 签名

```cangjie role=signature
public func add(test: UnitTestCase): TestGroupBuilder
```

为测试组合增加单元测试用例。

### 契约

参数：

- test: UnitTestCase - 单元测试用例。

返回值：

- TestGroupBuilder - 测试组合构造器。
