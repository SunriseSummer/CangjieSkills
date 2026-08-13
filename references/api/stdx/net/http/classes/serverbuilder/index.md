<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.serverbuilder" parent="stdx.net.http" -->
# ServerBuilder

[← stdx.net.http](../../index.md)

`ServerBuilder`

提供 Server 实例构建器。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 创建 ServerBuilder 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`addr(addr: String): ServerBuilder`](addr.md) | 设置服务端监听地址，若 listener 被设定，此值被忽略。 |
| [`afterBind(f: ()->Unit): ServerBuilder`](afterbind.md) | 注册服务器启动时的回调函数，服务内部 ServerSocket 实例 bind 之后，accept 之前将调用该函数。 |
| [`build(): Server`](build.md) | 根据设置的参数构建 Server 实例。 |
| [`distributor(distributor: HttpRequestDistributor): ServerBuilder`](distributor.md) | 设置请求分发器，请求分发器会根据 url 将请求分发给对应的 handler。 |
| [`enableConnectProtocol(flag: Bool): ServerBuilder`](enableconnectprotocol.md) | HTTP/2 专用，设置本端是否接收 CONNECT 请求，默认 false。 |
| [`headerTableSize(size: UInt32): ServerBuilder`](headertablesize.md) | 设置服务端 HTTP/2 Hpack 动态表的初始值，默认值为 4096。 |
| [`httpKeepAliveTimeout(timeout: Duration): ServerBuilder`](httpkeepalivetimeout.md) | HTTP/1.1 专用，设定服务端连接保活时长，该时长内客户端未再次发送请求，服务端将关闭长连接，默认不进行限制。 |
| [`initialWindowSize(size: UInt32): ServerBuilder`](initialwindowsize.md) | HTTP/2 专用，设置当前服务器上每个流的接收报文的初始流量窗口大小，默认值为 65535。 |
| [`listener(listener: ServerSocket): ServerBuilder`](listener.md) | 服务端调用此函数对指定 socket 进行绑定监听。 |
| [`logger(logger: Logger): ServerBuilder`](logger.md) | 设定服务器的 logger，默认 logger 级别为 INFO，logger 内容将写入 标准输出。 |
| [`maxConcurrentStreams(size: UInt32): ServerBuilder`](maxconcurrentstreams.md) | HTTP/2 专用，设置本端同时处理的最大请求数量，限制对端并发发送请求的数量，默认值为 100。 |
| [`maxFrameSize(size: UInt32): ServerBuilder`](maxframesize.md) | HTTP/2 专用，设置本端接收的一个帧的最大长度，用来限制对端发送帧的长度，默认值为 16384. 取值范围为 2^14 至 2^24 - 1。 |
| [`maxHeaderListSize(size: UInt32): ServerBuilder`](maxheaderlistsize.md) | 获取客户端支持的 HTTP/2 最大头部（Header）大小。 |
| [`maxRequestBodySize(size: Int64): ServerBuilder`](maxrequestbodysize.md) | 设置服务端允许客户端发送单个请求的请求体最大长度，请求体长度超过该值时，将返回状态码为 413 的响应。 |
| [`maxRequestHeaderSize(size: Int64): ServerBuilder`](maxrequestheadersize.md) | 设定服务端允许客户端发送单个请求的请求头最大长度，请求头长度超过该值时，将返回状态码为 431 的响应；仅对 HTTP/1.1 生效，HTTP/2 中有专门的配置 maxHeaderListSize。 |
| [`onShutdown(f: () -> Unit): ServerBuilder`](onshutdown.md) | 注册服务器关闭时的回调函数，服务器关闭时将调用该回调函数，重复调用将覆盖之前注册的函数。 |
| [`port(port: UInt16): ServerBuilder`](port.md) | 设置服务端监听端口，若 listener 被设定，此值被忽略。 |
| [`protocolServiceFactory(factory: ProtocolServiceFactory): ServerBuilder`](protocolservicefactory.md) | 设置协议服务工厂，服务协议工厂会生成每个协议所需的服务实例，不设置时使用默认工厂。 |
| [`readHeaderTimeout(timeout: Duration): ServerBuilder`](readheadertimeout.md) | 设定服务端读取客户端发送一个请求的请求头最大时长，超过该时长将不再进行读取并关闭连接，默认不进行限制。 |
| [`readTimeout(timeout: Duration): ServerBuilder`](readtimeout.md) | 设定服务端读取一个请求的最大时长，超过该时长将不再进行读取并关闭连接，默认不进行限制。 |
| [`servicePoolConfig(cfg: ServicePoolConfig): ServerBuilder`](servicepoolconfig.md) | 服务过程中使用的协程池相关设置，具体说明见 ServicePoolConfig 结构体。 |
| [`tlsConfig(config: TlsServerConfig): ServerBuilder`](tlsconfig.md) | 设置 TLS 层配置，默认不对其进行设置。 |
| [`transportConfig(config: TransportConfig): ServerBuilder`](transportconfig.md) | 设置传输层配置，默认配置详见 TransportConfig 结构体说明。 |
| [`writeTimeout(timeout: Duration): ServerBuilder`](writetimeout.md) | 设定服务端发送一个响应的最大时长，超过该时长将不再进行写入并关闭连接，默认不进行限制。 |
