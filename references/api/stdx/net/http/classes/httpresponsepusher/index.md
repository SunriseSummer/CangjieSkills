<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.httpresponsepusher" parent="stdx.net.http" -->
# HttpResponsePusher

[← stdx.net.http](../../index.md)

`HttpResponsePusher`

HTTP/2 服务器推送。

## 方法

| 签名 | 功能 |
|---|---|
| [`static getPusher(ctx: HttpContext): ?HttpResponsePusher`](getpusher.md) | 获取 HttpResponsePusher 实例，如果客户端拒绝推送，将返回 None。 |
| [`push(path: String, method: String, header: HttpHeaders): Unit`](push.md) | 向客户端发送推送请求，path 为请求地址，method 为请求方法，header 为请求头。 |
