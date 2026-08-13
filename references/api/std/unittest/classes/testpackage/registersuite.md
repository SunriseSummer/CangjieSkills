<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.testpackage.registersuite" parent="std.unittest.class.testpackage" -->
# TestPackage.registerSuite

[← TestPackage](index.md)

## 签名

```cangjie role=signature
public func registerSuite(suite: () -> TestSuite): Unit
```

注册测试套。

## 契约

参数：

- suite: () -> TestSuite - 测试套生成闭包。
