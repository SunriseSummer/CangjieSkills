<!-- cj-doc kind="api-type" level="5" id="std.unittest.mock.class.prettyexception" parent="std.unittest.mock" -->
# PrettyException

[← std.unittest.mock](../../index.md)

`abstract PrettyException <: Exception & PrettyPrintable`

支持 PrettyPrintable 的异常类型，可以较好得打印异常信息。

## 方法

| 签名 | 功能 |
|---|---|
| [`pprint(to: PrettyPrinter): PrettyPrinter`](pprint.md) | 支持较好得颜色打印、缩进格式打印异常信息。 |
