<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.server" parent="stdx.net.http" -->
# Server

[← stdx.net.http](../../index.md)

`Server`

HTTP 服务端类型（有时会被直觉检索为 HttpServer）；注册处理器后用 `serve()` 启动，并用 `closeGracefully()` 有序关闭。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`addr: String`](prop-addr.md) | 获取服务端监听地址。 |
| [`distributor: HttpRequestDistributor`](prop-distributor.md) | 获取请求分发器，请求分发器会根据 url 将请求分发给对应的 handler。 |
| [`enableConnectProtocol: Bool`](prop-enableconnectprotocol.md) | HTTP/2 专用，用来限制对端发送的报文是否支持通过 connect 方法升级协议，true 表示支持。 |
| [`headerTableSize: UInt32`](prop-headertablesize.md) | 获取服务端 HTTP/2 Hpack 动态表的初始值，默认值为 4096。 |
| [`httpKeepAliveTimeout: Duration`](prop-httpkeepalivetimeout.md) | HTTP/1.1 专用，获取服务器设定的保持长连接的超时时间。 |
| [`initialWindowSize: UInt32`](prop-initialwindowsize.md) | HTTP/2 专用，用来限制对端发送的报文 stream 初始流量窗口大小。 |
| [`listener: ServerSocket`](prop-listener.md) | 获取服务器绑定 socket。 |
| [`logger: Logger`](prop-logger.md) | 获取服务器日志记录器，设置 logger.level 将立即生效，记录器应该是线程安全的。 |
| [`maxConcurrentStreams: UInt32`](prop-maxconcurrentstreams.md) | HTTP/2 专用，用来限制连接同时处理的最大请求数量。 |
| [`maxFrameSize: UInt32`](prop-maxframesize.md) | HTTP/2 专用，用来限制对端发送的报文一个帧的最大长度。 |
| [`maxHeaderListSize: UInt32`](prop-maxheaderlistsize.md) | 获取客户端支持的 HTTP/2 最大头部（Header）大小。 |
| [`maxRequestBodySize: Int64`](prop-maxrequestbodysize.md) | 获取服务器设定的读取请求的请求体最大值，仅对于 HTTP/1.1 且未设置 "Transfer-Encoding: chunked" 的请求生效。 |
| [`maxRequestHeaderSize: Int64`](prop-maxrequestheadersize.md) | 获取服务器设定的读取请求的请求头最大值。 |
| [`port: UInt16`](prop-port.md) | 获取服务端监听端口。 |
| [`protocolServiceFactory: ProtocolServiceFactory`](prop-protocolservicefactory.md) | 获取协议服务工厂，服务协议工厂会生成每个协议所需的服务实例。 |
| [`readHeaderTimeout: Duration`](prop-readheadertimeout.md) | 获取服务器设定的读取请求头的超时时间。 |
| [`readTimeout: Duration`](prop-readtimeout.md) | 获取服务器设定的读取整个请求的超时时间。 |
| [`servicePoolConfig: ServicePoolConfig`](prop-servicepoolconfig.md) | 获取协程池配置实例。 |
| [`transportConfig: TransportConfig`](prop-transportconfig.md) | 获取服务器设定的传输层配置。 |
| [`writeTimeout: Duration`](prop-writetimeout.md) | 获取服务器设定的写响应的超时时间。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`afterBind(f: ()-> Unit): Unit`](afterbind.md) | 注册服务器启动时的回调函数，服务内部 ServerSocket 实例 bind 之后，accept 之前将调用该函数。 |
| [`close(): Unit`](close.md) | 关闭服务器，服务器关闭后将不再对请求进行读取与处理，重复关闭将只有第一次生效（包括 close 和 closeGracefully）。 |
| [`closeGracefully(): Unit`](closegracefully.md) | 关闭服务器，服务器关闭后将不再对请求进行读取，当前正在进行处理的服务器待处理结束后进行关闭。 |
| [`getTlsConfig(): ?TlsServerConfig`](gettlsconfig.md) | 获取服务器设定的 TLS 层配置。 |
| [`onShutdown(f: () -> Unit): Unit`](onshutdown.md) | 注册服务器关闭时的回调函数，服务器关闭时将调用该回调函数，重复调用将覆盖之前注册的函数。 |
| [`serve(): Unit`](serve.md) | 启动服务端进程，不支持重复启动。 |
| [`updateCA(newCa: Array<X509Certificate>): Unit`](updateca.md) | 对 CA 证书进行热更新。 |
| [`updateCA(newCaFile: String): Unit`](updateca.md) | 对 CA 证书进行热更新。 |
| [`updateCert(certChain: Array<X509Certificate>, certKey: PrivateKey): Unit`](updatecert.md) | 对 TLS 证书进行热更新。 |
| [`updateCert(certificateChainFile: String, privateKeyFile: String): Unit`](updatecert.md) | 对 TLS 证书进行热更新。 |
