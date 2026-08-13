<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.testsuitebuilder.beforeall" parent="std.unittest.class.testsuitebuilder" -->
# TestSuiteBuilder.beforeAll

[← TestSuiteBuilder](index.md)

## 签名

```cangjie role=signature
public func beforeAll(body: () -> Unit): TestSuiteBuilder
```

为测试套添加在所有用例执行前执行的生命周期管理闭包。

## 契约

参数：

- body: () -> Unit - 执行体。

返回值：

- TestSuiteBuilder - 测试组合构造器。
