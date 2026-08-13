<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.httpresponse" parent="stdx.net.http" -->
# HttpResponse

[← stdx.net.http](../../index.md)

`HttpResponse <: ToString`

Http 响应类。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`body: InputStream`](prop-body.md) | 获取 body。 |
| [`bodySize: Option<Int64>`](prop-bodysize.md) | 获取响应 body 长度。 |
| [`isPersistent: Bool`](prop-ispersistent.md) | 表示该响应是否为长连接，即响应 header 是否不包含 `Connection: close`。 |
| [`headers: HttpHeaders`](prop-headers.md) | 获取 headers，headers 详述见 HttpHeaders 类，获取后，可通过调用 HttpHeaders 实例成员函数，修改该请求的 headers。 |
| [`request: Option<HttpRequest>`](prop-request.md) | 获取该响应对应的请求，默认为 None。 |
| [`status: UInt16`](prop-status.md) | 获取响应的状态码，默认值为 200。 |
| [`trailers: HttpHeaders`](prop-trailers.md) | 获取 trailers，trailers 详述见 HttpHeaders 类，获取后，可通过调用 HttpHeaders 实例成员函数，修改该请求的 trailers。 |
| [`version: Protocol`](prop-version.md) | 获取响应的协议版本，默认值为 HTTP1_1。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`close(): Unit`](close.md) | 如果用户不再需要未读完的 body 数据，可以调用此接口关闭连接以释放资源。 |
| [`override toString(): String`](tostring.md) | 把响应转换为字符串，包括 status-line，headers，body size， trailers。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend HttpResponse`](extensions/extend-httpresponse.md) | 为 HttpResonse 扩展 HTTP/2.0 特有的方法。 |
