<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.interface.httprequestdistributor" parent="stdx.net.http" -->
# HttpRequestDistributor

[← stdx.net.http](../../index.md)

`HttpRequestDistributor`

Http request 分发器接口，将一个 request 按照 url 中的 path 分发给对应的 HttpRequestHandler 处理。

## 方法

| 签名 | 功能 |
|---|---|
| [`distribute(path: String): HttpRequestHandler`](distribute.md) | 分发请求处理器，未找到对应请求处理器时，将返回 NotFoundHandler 以返回 404 状态码。 |
| [`register(path: String, handler: (HttpContext) -> Unit): Unit`](register.md) | 注册请求处理器。 |
| [`register(path: String, handler: HttpRequestHandler): Unit`](register.md) | 注册请求处理器。 |
