<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.testpackage.registercase" parent="std.unittest.class.testpackage" -->
# TestPackage.registerCase

[← TestPackage](index.md)

## 签名

```cangjie role=signature
public func registerCase(testCase: () -> UnitTestCase): Unit
```

注册单元测试用例。

## 契约

参数：

- testCase: () -> UnitTestCase - 单元测试用例生成闭包。
