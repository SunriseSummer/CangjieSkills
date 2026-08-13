<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.testreport.reportto" parent="std.unittest.class.testreport" -->
# TestReport.reportTo

[← TestReport](index.md)

## 签名

```cangjie role=signature
public func reportTo<T>(reporter: Reporter<TestReport, T>): T
```

打印单元测试执行报告。

## 契约

参数：

- reporter: Reporter\<TestReport, T> - 单元测试报告打印器。

返回值：

- T - 打印返回值，一般为 Unit 。
