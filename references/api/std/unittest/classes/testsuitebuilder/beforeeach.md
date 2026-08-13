<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.testsuitebuilder.beforeeach" parent="std.unittest.class.testsuitebuilder" -->
# TestSuiteBuilder.beforeEach

[← TestSuiteBuilder](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func beforeEach(() -> Unit)

### 签名

```cangjie role=signature
public func beforeEach(body: () -> Unit): TestSuiteBuilder
```

为测试套添加在每个用例执行前执行的生命周期管理闭包。

### 契约

参数：

- body: () -> Unit - 执行体。

返回值：

- TestSuiteBuilder - 测试组合构造器。

## func beforeEach((String) -> Unit)

### 签名

```cangjie role=signature
public func beforeEach(body: (String) -> Unit): TestSuiteBuilder
```

为测试套添加在每个用例执行前执行的生命周期管理闭包。

### 契约

参数：

- body: (String) -> Unit - 执行体。

返回值：

- TestSuiteBuilder - 测试组合构造器。
