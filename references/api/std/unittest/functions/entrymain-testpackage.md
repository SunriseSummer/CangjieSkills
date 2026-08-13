<!-- cj-doc kind="api-member" level="5" id="std.unittest.func.entrymain-testpackage" parent="std.unittest" -->
# entryMain(TestPackage)

[← std.unittest](../index.md)

## 签名

```cangjie role=signature
public func entryMain(testPackage: TestPackage): Int64
```

提供给 `cjc --test` 使用，框架执行测试用例的入口函数。

## 契约

参数：

- testPackage: TestPackage - 测试包对象。

返回值：

- Int64 - 执行结果。
