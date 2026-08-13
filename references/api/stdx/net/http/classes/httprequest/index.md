<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.httprequest" parent="stdx.net.http" -->
# HttpRequest

[← stdx.net.http](../../index.md)

`HttpRequest <: ToString`

此类为 Http 请求类。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`body: InputStream`](prop-body.md) | 获取 body。 |
| [`bodySize: Option<Int64>`](prop-bodysize.md) | 获取请求 body 长度。 |
| [`isPersistent: Bool`](prop-ispersistent.md) | 表示该请求是否为长连接，即请求 header 是否不包含 `Connection: close`。 |
| [`form: Form`](prop-form.md) | 获取请求中的表单信息。 |
| [`headers: HttpHeaders`](prop-headers.md) | 获取 headers，headers 详述见 HttpHeaders 类，获取后，可通过调用 HttpHeaders 实例成员函数，修改该请求的 headers。 |
| [`method: String`](prop-method.md) | 获取 method，如 "GET", "POST"，request 实例的 method 无法修改。 |
| [`readTimeout: ?Duration`](prop-readtimeout.md) | 表示该请求的请求级读超时时间。 |
| [`remoteAddr: String`](prop-remoteaddr.md) | 用于服务端，获取对端地址，即客户端地址，格式为 ip: port，用户无法设置，自定义的 request 对象调用该属性返回 ""，服务端 handler 中调用该属性返回客户端地址。 |
| [`trailers: HttpHeaders`](prop-trailers.md) | 获取 trailers，trailers 详述见 HttpHeaders 类，获取后，可通过调用 HttpHeaders 实例成员函数，修改该请求的 trailers。 |
| [`url: URL`](prop-url.md) | 获取 url，表示客户端访问的 url。 |
| [`version: Protocol`](prop-version.md) | 获取 http 版本，如 HTTP1_1 和 HTTP2_0，request 实例的 version 无法修改。 |
| [`writeTimeout: ?Duration`](prop-writetimeout.md) | 表示该请求的请求级写超时时间，None 表示没有设置；Some(Duration) 表示设置了写超时时间。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override toString(): String`](tostring.md) | 把请求转换为字符串，包括 start line，headers，body size，trailers。 |
