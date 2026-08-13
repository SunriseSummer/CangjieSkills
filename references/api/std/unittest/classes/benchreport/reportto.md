<!-- cj-doc kind="api-member" level="6" id="std.unittest.class.benchreport.reportto" parent="std.unittest.class.benchreport" -->
# BenchReport.reportTo

[← BenchReport](index.md)

## 签名

```cangjie role=signature
public func reportTo<T>(reporter: Reporter<BenchReport, T>): T
```

打印性能用例结果报告。

## 契约

参数：

- reporter: Reporter\<BenchReport, T> - 性能用例结果报告。

返回值：

- T - 打印结果返回值。一般为 Unit 类型。
