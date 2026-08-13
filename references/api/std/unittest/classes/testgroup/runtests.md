<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.testgroup.runtests" parent="std.unittest.class.testgroup" -->
# TestGroup.runTests

[← TestGroup](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func runTests()

### 签名

```cangjie role=signature
public func runTests(): TestReport
```

执行所有单元测试用例。

### 契约

返回值：

- TestReport - 单元测试用例报告。

## func runTests(Configuration)

### 签名

```cangjie role=signature
public func runTests(configuration: Configuration): TestReport
```

带运行配置得执行所有单元测试用例。

### 契约

参数：

- configuration: Configuration - 运行配置。

返回值：

- TestReport - 单元测试用例报告。
