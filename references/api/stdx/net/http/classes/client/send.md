<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.client.send" parent="stdx.net.http.class.client" -->
# Client.send

[← Client](index.md)

## 签名

```cangjie role=signature
public func send(req: HttpRequest): HttpResponse
```

通用请求函数，发送 HttpRequest 到 url 中的服务器，接收 HttpResponse。

## 契约

> **注意：**
>
> - 对于 HTTP/1.1，如果请求中有 body 要发，那么需要保证 Content-Length 和 Transfer-Encoding: chunked 必有且只有一个，以 chunked 形式发时，每段 chunk 最大为 8192 字节；如果用户发送的 body 为自己实现的 InputStream 类，则需要自己保证 Content-Length 和 Transfer-Encoding: chunked 设置且只设置了一个；如果用户采用默认的 body 发送，Content-Length 和 Transfer-Encoding: chunked 都缺失时，我们会为其补上 Content-Length header，值为 body.size；
> - 用户如果设置了 Content-Length，则需要保证其正确性：如果所发 body 的内容大于等于 Content-Length 的值，我们会发送长度为 Content-Length 值的数据；如果所发 body 的内容小于 Content-Length 的值，此时如果 body 是默认的 body，则会抛出 HttpException，如果 body 是用户自己实现的 InputStream 类，其行为便无法保证（可能会造成服务器端的读 request 超时或者客户端的收 response 超时）；
> - 升级函数通过 WebSocket 的 upgradeFromClient 或 Client 的 upgrade 接口发出，调用 client 的其他函数发送 upgrade 请求会抛出异常；
> - 协议规定 TRACE 请求无法携带内容，故用户发送带有 body 的 TRACE 请求时会抛出异常；
> - HTTP/1.1 默认对同一个服务器的连接数不超过 10 个。response 的 body 需要用户调用 `body.read(buf: Array<Byte>)` 函数去读。body 被读完后，连接才能被客户端对象复用，否则请求相同的服务器也会新建连接。新建连接时如果连接数超出限制则会抛出 HttpException；
> - body.read 函数将 body 读完之后返回 0，如果读的时候连接断开会抛出 ConnectionException；
> - HTTP/1.1 的升级请求如果收到 101 响应，则表示切换协议，此连接便不归 client 管理；
> - 下文的快捷请求函数的注意点与 send 相同。

参数：

- req: HttpRequest - 发送的请求。

返回值：

- HttpResponse - 服务端返回处理该请求的响应。

异常：

- UrlSyntaxException - 请求中 URL 错误时抛此异常。
- SocketException - Socket 连接出现错误时抛此异常。
- ConnectionException - 从连接中读数据时对端已关闭连接抛此异常。
- SocketTimeoutException - Socket 连接超时抛此异常。
- TlsException - Tls 连接建立失败或通信异常抛此异常。
- HttpException - 当用户未使用 http 库提供的 API 升级 WebSocket 时抛此异常。
- HttpTimeoutException - 请求超时或读 HttpResponse.body 超时抛此异常。
