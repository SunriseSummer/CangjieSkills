<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.testsuite.runtests" parent="std.unittest.class.testsuite" -->
# TestSuite.runTests

[← TestSuite](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func runTests()

### 签名

```cangjie role=signature
public func runTests(): TestReport
```

运行测试套。

### 契约

返回值：

- TestReport - 测试套运行结果。

## func runTests(Configuration)

### 签名

```cangjie role=signature
public func runTests(configuration: Configuration): TestReport
```

带配置信息得运行测试套。

### 契约

参数：

- configuration: Configuration - 运行配置信息。

返回值：

- TestReport - 测试套运行结果。
