<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.client" parent="stdx.net.http" -->
# Client

[← stdx.net.http](../../index.md)

`Client`

发送 Http request、随时关闭等。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`autoRedirect: Bool`](prop-autoredirect.md) | 客户端是否会自动进行重定向，304 状态码默认不重定向。 |
| [`connector: (SocketAddress) -> StreamingSocket`](prop-connector.md) | 客户端调用此函数获取到服务器的连接。 |
| [`cookieJar: ?CookieJar`](prop-cookiejar.md) | 用于存储客户端所有 Cookie，如果配置为 None，则不会启用 Cookie。 |
| [`enablePush: Bool`](prop-enablepush.md) | 客户端 HTTP/2 是否支持服务器推送，默认值为 true。 |
| [`headerTableSize: UInt32`](prop-headertablesize.md) | 获取客户端 HTTP/2 Hpack 动态表的初始值，默认值为 4096。 |
| [`httpProxy: String`](prop-httpproxy.md) | 获取客户端 http 代理，默认使用系统环境变量 http_proxy 的值，用字符串表示，格式为：`"http://host:port"`，例如：`"http://192.168.1.1:80"`。 |
| [`httpsProxy: String`](prop-httpsproxy.md) | 获取客户端 https 代理，默认使用系统环境变量 https_proxy 的值，用字符串表示，格式为：`"http://host:port"`，例如：`"http://192.168.1.1:443"`。 |
| [`initialWindowSize: UInt32`](prop-initialwindowsize.md) | 获取客户端 HTTP/2 流控窗口初始值，默认值为 65535 ，取值范围为 0 至 2^31 - 1。 |
| [`logger: Logger`](prop-logger.md) | 获取客户端日志记录器，设置 logger.level 将立即生效，记录器应该是线程安全的。 |
| [`maxConcurrentStreams: UInt32`](prop-maxconcurrentstreams.md) | 获取客户端 HTTP/2 初始最大并发流数量，默认值为 2^31 - 1。 |
| [`maxFrameSize: UInt32`](prop-maxframesize.md) | 获取客户端 HTTP/2 初始最大帧大小。 |
| [`maxHeaderListSize: UInt32`](prop-maxheaderlistsize.md) | 获取客户端支持的 HTTP/2 最大头部（Header）大小。 |
| [`poolSize: Int64`](prop-poolsize.md) | 配置 HTTP/1.1 客户端使用的连接池的大小，亦可表示对同一个主机（host:port）同时存在的连接数的最大值。 |
| [`readTimeout: Duration`](prop-readtimeout.md) | 获取客户端设定的读取整个响应的超时时间，默认值为 15 秒。 |
| [`writeTimeout: Duration`](prop-writetimeout.md) | 获取客户端设定的写请求的超时时间，默认值为 15 秒。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`close(): Unit`](close.md) | 关闭客户端建立的所有连接，调用后不能继续发送请求。 |
| [`connect(url: String, header!: HttpHeaders = HttpHeaders(), version!: Protocol = HTTP1_1): (HttpResponse, ?StreamingSocket)`](connect.md) | 发送 CONNECT 请求与服务器建立隧道，返回建连成功后的连接，连接由用户负责关闭。 |
| [`delete(url: String): HttpResponse`](delete.md) | 请求方法为 DELETE 的便捷请求函数。 |
| [`get(url: String): HttpResponse`](get.md) | 请求方法为 GET 的便捷请求函数。 |
| [`getTlsConfig(): ?TlsClientConfig`](gettlsconfig.md) | 获取客户端设定的 TLS 层配置。 |
| [`head(url: String): HttpResponse`](head.md) | 请求方法为 HEAD 的便捷请求函数。 |
| [`options(url: String): HttpResponse`](options.md) | 请求方法为 OPTIONS 的便捷请求函数。 |
| [`post(url: String, body: Array<UInt8>): HttpResponse`](post.md) | 请求方法为 POST 的便捷请求函数。 |
| [`post(url: String, body: InputStream): HttpResponse`](post.md) | 请求方法为 POST 的便捷请求函数。 |
| [`post(url: String, body: String): HttpResponse`](post.md) | 请求方法为 POST 的便捷请求函数。 |
| [`put(url: String, body: Array<UInt8>): HttpResponse`](put.md) | 请求方法为 PUT 的便捷请求函数。 |
| [`put(url: String, body: InputStream): HttpResponse`](put.md) | 请求方法为 PUT 的便捷请求函数。 |
| [`put(url: String, body: String): HttpResponse`](put.md) | 请求方法为 PUT 的便捷请求函数。 |
| [`send(req: HttpRequest): HttpResponse`](send.md) | 通用请求函数，发送 HttpRequest 到 url 中的服务器，接收 HttpResponse。 |
| [`upgrade(req: HttpRequest): (HttpResponse, ?StreamingSocket)`](upgrade.md) | 发送请求并升级协议，用户设置请求头，返回升级后的连接（如果升级成功），连接由用户负责关闭。 |
