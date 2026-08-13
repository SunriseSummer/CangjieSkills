<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.httpresponsebuilder" parent="stdx.net.http" -->
# HttpResponseBuilder

[← stdx.net.http](../../index.md)

`HttpResponseBuilder`

用于构造 HttpResponse 实例。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个新 HttpResponseBuilder。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`addHeaders(headers: HttpHeaders): HttpResponseBuilder`](addheaders.md) | 向响应 header 添加参数 HttpHeaders 中的键值对。 |
| [`addTrailers(trailers: HttpHeaders): HttpResponseBuilder`](addtrailers.md) | 向响应 trailer 添加参数 HttpHeaders 中的键值对。 |
| [`body(body: Array<UInt8>): HttpResponseBuilder`](body.md) | 设置响应 body，如果已经设置过，调用该函数将替换原 body。 |
| [`body(body: InputStream): HttpResponseBuilder`](body.md) | 设置响应 body，如果已经设置过，调用该函数将替换原 body 调用该函数设置请求 body。 |
| [`body(body: String): HttpResponseBuilder`](body.md) | 设置响应 body，如果已经设置过，调用该函数将替换原 body 调用该函数设置请求 body。 |
| [`build(): HttpResponse`](build.md) | 根据 HttpResponseBuilder 实例生成一个 HttpResponse 实例。 |
| [`header(name: String, value: String): HttpResponseBuilder`](header.md) | 向响应 header 添加指定键值对，规则同 HttpHeaders 类的 add 函数。 |
| [`request(request: HttpRequest): HttpResponseBuilder`](request.md) | 设置响应对应的请求。 |
| [`setHeaders(headers: HttpHeaders): HttpResponseBuilder`](setheaders.md) | 设置响应 header，如果已经设置过，调用该函数将替换原 header。 |
| [`setTrailers(trailers: HttpHeaders): HttpResponseBuilder`](settrailers.md) | 设置响应 trailer，如果已经设置过，调用该函数将替换原 trailer。 |
| [`status(status: UInt16): HttpResponseBuilder`](status.md) | 设置 http 响应状态码。 |
| [`trailer(name: String, value: String): HttpResponseBuilder`](trailer.md) | 向响应 trailer 添加指定键值对，规则同 HttpHeaders 类的 add 函数。 |
| [`version(version: Protocol): HttpResponseBuilder`](version.md) | 设置 http 响应协议版本。 |
