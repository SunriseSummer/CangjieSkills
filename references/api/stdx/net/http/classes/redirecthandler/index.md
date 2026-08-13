<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.redirecthandler" parent="stdx.net.http" -->
# RedirectHandler

[← stdx.net.http](../../index.md)

`RedirectHandler <: HttpRequestHandler`

便捷的 Http 处理器，用于回复重定向响应。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(url: String, code: UInt16)`](init.md) | RedirectHandler 的构造函数。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`handle(ctx: HttpContext): Unit`](handle.md) | 处理 Http 请求，回复重定向响应。 |
