<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.httprequestbuilder" parent="stdx.net.http" -->
# HttpRequestBuilder

[← stdx.net.http](../../index.md)

`HttpRequestBuilder`

HttpRequestBuilder 类用于构造 HttpRequest 实例。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个新 HttpRequestBuilder。 |
| [`init(request: HttpRequest)`](init.md) | 通过 request 构造一个具有 request 属性的 HttpRequestBuilder。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`addHeaders(headers: HttpHeaders): HttpRequestBuilder`](addheaders.md) | 向请求 header 添加参数 HttpHeaders 中的键值对。 |
| [`addTrailers(trailers: HttpHeaders): HttpRequestBuilder`](addtrailers.md) | 向请求 trailer 添加参数 HttpHeaders 中的键值对。 |
| [`body(body: Array<UInt8>): HttpRequestBuilder`](body.md) | 设置请求 body。 |
| [`body(body: InputStream): HttpRequestBuilder`](body.md) | 设置请求 body。 |
| [`body(body: String): HttpRequestBuilder`](body.md) | 设置请求 body，如果已经设置过，调用该函数将替换原 body 调用该函数设置请求 body，则 body 将以内置的 InputStream 实现类表示，其大小已知。 |
| [`build(): HttpRequest`](build.md) | 根据 HttpRequestBuilder 实例生成一个 HttpRequest 实例。 |
| [`connect(): HttpRequestBuilder`](connect.md) | 构造 method 为 "CONNECT" 的请求的便捷函数。 |
| [`delete(): HttpRequestBuilder`](delete.md) | 构造 method 为 "DELETE" 的请求的便捷函数。 |
| [`get(): HttpRequestBuilder`](get.md) | 构造 method 为 "GET" 的请求的便捷函数。 |
| [`head(): HttpRequestBuilder`](head.md) | 构造 method 为 "HEAD" 的请求的便捷函数。 |
| [`header(name: String, value: String): HttpRequestBuilder`](header.md) | 向请求 header 添加指定键值对，规则同 HttpHeaders 类的 add 函数。 |
| [`method(method: String): HttpRequestBuilder`](method.md) | 设置请求 method，默认请求 method 为 "GET"。 |
| [`options(): HttpRequestBuilder`](options.md) | 构造 method 为 "OPTIONS" 的请求的便捷函数。 |
| [`post(): HttpRequestBuilder`](post.md) | 构造 method 为 "POST" 的请求的便捷函数。 |
| [`priority(urg: Int64, inc: Bool): HttpRequestBuilder`](priority.md) | 设置 priority 头的便捷函数，调用此函数后，将生成 priority 头，形如："priority: urgency=x, i"。 |
| [`put(): HttpRequestBuilder`](put.md) | 构造 method 为 "PUT" 的请求的便捷函数。 |
| [`readTimeout(timeout: Duration): HttpRequestBuilder`](readtimeout.md) | 设置此请求的读超时时间。 |
| [`setHeaders(headers: HttpHeaders): HttpRequestBuilder`](setheaders.md) | 设置请求 header，如果已经设置过，调用该函数将替换原 header。 |
| [`setTrailers(trailers: HttpHeaders): HttpRequestBuilder`](settrailers.md) | 设置请求 trailer，如果已经设置过，调用该函数将替换原 trailer。 |
| [`trace(): HttpRequestBuilder`](trace.md) | 构造 method 为 "TRACE" 的请求的便捷函数。 |
| [`trailer(name: String, value: String): HttpRequestBuilder`](trailer.md) | 向请求 trailer 添加指定键值对，规则同 HttpHeaders 类的 add 函数。 |
| [`url(rawUrl: String): HttpRequestBuilder`](url.md) | 设置请求 url，默认 url 为空的 URL 对象。 |
| [`url(url: URL): HttpRequestBuilder`](url.md) | 设置请求 url，默认 url 为空的 URL 对象，即 URL.parse("")。 |
| [`version(version: Protocol): HttpRequestBuilder`](version.md) | 设置请求的 http 协议版本，默认为 UnknownProtocol("")，客户端会根据 tls 配置自动选择协议。 |
| [`writeTimeout(timeout: Duration): HttpRequestBuilder`](writetimeout.md) | 设置此请求的写超时时间。 |
