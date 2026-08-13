<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.clientbuilder" parent="stdx.net.http" -->
# ClientBuilder

[← stdx.net.http](../../index.md)

`ClientBuilder`

用于 Client 实例的构建，Client 没有公开的构造函数，用户只能通过 ClientBuilder 得到 Client 实例。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 创建新的 ClientBuilder 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`autoRedirect(auto: Bool): ClientBuilder`](autoredirect.md) | 配置客户端是否会自动进行重定向。 |
| [`build(): Client`](build.md) | 构造 Client 实例。 |
| [`connector(c: (SocketAddress) -> StreamingSocket): ClientBuilder`](connector.md) | 客户端调用此函数获取到服务器的连接。 |
| [`cookieJar(cookieJar: ?CookieJar): ClientBuilder`](cookiejar.md) | 用于存储客户端所有 Cookie。 |
| [`enablePush(enable: Bool): ClientBuilder`](enablepush.md) | 配置客户端 HTTP/2 是否支持服务器推送。 |
| [`headerTableSize(size: UInt32): ClientBuilder`](headertablesize.md) | 配置客户端 HTTP/2 Hpack 动态表初始值。 |
| [`httpProxy(addr: String): ClientBuilder`](httpproxy.md) | 设置客户端 http 代理，默认使用系统环境变量 http_proxy 的值。 |
| [`httpsProxy(addr: String): ClientBuilder`](httpsproxy.md) | 设置客户端 https 代理，默认使用系统环境变量 https_proxy 的值。 |
| [`initialWindowSize(size: UInt32): ClientBuilder`](initialwindowsize.md) | 配置客户端 HTTP/2 流控窗口初始值。 |
| [`logger(logger: Logger): ClientBuilder`](logger.md) | 设定客户端的 logger，默认 logger 级别为 INFO，logger 内容将写入 标准输出。 |
| [`maxConcurrentStreams(size: UInt32): ClientBuilder`](maxconcurrentstreams.md) | 配置客户端 HTTP/2 初始最大并发流数量。 |
| [`maxFrameSize(size: UInt32): ClientBuilder`](maxframesize.md) | 配置客户端 HTTP/2 初始最大帧大小。 |
| [`maxHeaderListSize(size: UInt32): ClientBuilder`](maxheaderlistsize.md) | 获取客户端支持的 HTTP/2 最大头部（Header）大小。 |
| [`noProxy(): ClientBuilder`](noproxy.md) | 调用此函数后，客户端不使用任何代理。 |
| [`poolSize(size: Int64): ClientBuilder`](poolsize.md) | 配置 HTTP/1.1 客户端使用的连接池的大小，亦可表示对同一个主机（host:port）同时存在的连接数的最大值。 |
| [`readTimeout(timeout: Duration): ClientBuilder`](readtimeout.md) | 设定客户端读取一个响应的最大时长。 |
| [`tlsConfig(config: TlsClientConfig): ClientBuilder`](tlsconfig.md) | 设置 TLS 层配置，默认不对其进行设置。 |
| [`writeTimeout(timeout: Duration): ClientBuilder`](writetimeout.md) | 设定客户端发送一个请求的最大时长。 |
