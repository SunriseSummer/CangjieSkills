<!-- cj-doc kind="api-type" level="5" id="std.unittest.class.assertintermediateexception" parent="std.unittest" -->
# AssertIntermediateException

[← std.unittest](../../index.md)

`AssertIntermediateException <: Exception`

@PowerAssert 检查失败时所抛出的异常。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`expression: String`](field-expression.md) | 检查的表达式。 |
| [`originalException: Exception`](field-originalexception.md) | 原始的类型信息。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`getOriginalStackTrace(): String`](getoriginalstacktrace.md) | 获取原始的栈信息。 |
