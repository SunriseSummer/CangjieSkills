<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.httpresponsewriter" parent="stdx.net.http" -->
# HttpResponseWriter

[← stdx.net.http](../../index.md)

`HttpResponseWriter`

HTTP response 消息体 Writer，支持用户控制消息体的发送过程。

## 方法

| 签名 | 功能 |
|---|---|
| [`HttpResponseWriter(let ctx: HttpContext)`](httpresponsewriter-httpcontext.md) | 构造一个 HttpResponseWriter 实例。 |
| [`write(buf: Array<Byte>): Unit`](write.md) | 发送 buf 中数据到客户端。 |
