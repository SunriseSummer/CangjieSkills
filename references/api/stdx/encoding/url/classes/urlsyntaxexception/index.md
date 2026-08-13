<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.url.class.urlsyntaxexception" parent="stdx.encoding.url" -->
# UrlSyntaxException

[← stdx.encoding.url](../../index.md)

`UrlSyntaxException <: Exception`

URL 解析异常类。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(reason: String)`](init.md) | 根据错误原因构造 UrlSyntaxException 实例。 |
| [`init(input: String, reason: String)`](init.md) | 根据 URL 及错误原因构造 UrlSyntaxException 实例。 |
| [`init(input: String, reason: String, pos: String)`](init.md) | 根据 URL 字符串，错误原因以及解析失败的部分，构造 UrlSyntaxException 实例。 |
