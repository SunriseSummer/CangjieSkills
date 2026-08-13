<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.httpcontext" parent="stdx.net.http" -->
# HttpContext

[← stdx.net.http](../../index.md)

`HttpContext`

Http 请求上下文，作为 HttpRequestHandler.handle 函数的参数在服务端使用。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`clientCertificate: ?Array<X509Certificate>`](prop-clientcertificate.md) | 获取 Http 客户端证书。 |
| [`request: HttpRequest`](prop-request.md) | 获取 Http 请求。 |
| [`responseBuilder: HttpResponseBuilder`](prop-responsebuilder.md) | 获取 Http 响应构建器。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`isClosed(): Bool`](isclosed.md) | 使用 HTTP/1.1 协议时，判断 socket 是否已关闭；使用 HTTP/2 协议时，判断 HTTP/2 流是否已关闭。 |
