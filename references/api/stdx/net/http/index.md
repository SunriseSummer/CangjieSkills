<!-- cj-doc kind="api-package" level="4" id="stdx.net.http" parent="api.stdx" -->
# stdx.net.http

[← stdx 包索引](../../index.md)

提供 HTTP/1.1、HTTP/2 和 WebSocket 客户端与服务端实现。

包路径：`stdx.net.http`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`Client`](classes/client/index.md) | 发送 Http request、随时关闭等。 |
| [`ClientBuilder`](classes/clientbuilder/index.md) | 用于 Client 实例的构建，Client 没有公开的构造函数，用户只能通过 ClientBuilder 得到 Client 实例。 |
| [`Cookie`](classes/cookie/index.md) | HTTP 本身是无状态的，server 为了知道 client 的状态，提供个性化的服务，便可以通过 Cookie 来维护一个有状态的会话。 |
| [`FileHandler <: HttpRequestHandler`](classes/filehandler/index.md) | 用于处理文件下载或者文件上传。 |
| [`FuncHandler <: HttpRequestHandler`](classes/funchandler/index.md) | HttpRequestHandler 接口包装类，把单个函数包装成 HttpRequestHandler。 |
| [`HttpContext`](classes/httpcontext/index.md) | Http 请求上下文，作为 HttpRequestHandler.handle 函数的参数在服务端使用。 |
| [`HttpHeaders <: Iterable<(String, Collection<String>)>`](classes/httpheaders/index.md) | 此类用于表示 Http 报文中的 header 和 trailer，定义了相关增、删、改、查操作。 |
| [`HttpRequest <: ToString`](classes/httprequest/index.md) | 此类为 Http 请求类。 |
| [`HttpRequestBuilder`](classes/httprequestbuilder/index.md) | HttpRequestBuilder 类用于构造 HttpRequest 实例。 |
| [`HttpResponse <: ToString`](classes/httpresponse/index.md) | Http 响应类。 |
| [`HttpResponseBuilder`](classes/httpresponsebuilder/index.md) | 用于构造 HttpResponse 实例。 |
| [`HttpResponsePusher`](classes/httpresponsepusher/index.md) | HTTP/2 服务器推送。 |
| [`HttpResponseWriter`](classes/httpresponsewriter/index.md) | HTTP response 消息体 Writer，支持用户控制消息体的发送过程。 |
| [`NotFoundHandler <: HttpRequestHandler`](classes/notfoundhandler/index.md) | 便捷的 Http 请求处理器，`404 Not Found` 处理器。 |
| [`OptionsHandler <: HttpRequestHandler`](classes/optionshandler/index.md) | 便捷的 Http 处理器，用于处理 OPTIONS 请求。 |
| [`abstract ProtocolService`](classes/protocolservice.md) | Http 协议服务实例，为单个客户端连接提供 Http 服务，包括对客户端 request 报文的解析、 request 的分发处理、 response 的发送等。 |
| [`RedirectHandler <: HttpRequestHandler`](classes/redirecthandler/index.md) | 便捷的 Http 处理器，用于回复重定向响应。 |
| [`Server`](classes/server/index.md) | HTTP 服务端类型（有时会被直觉检索为 HttpServer）；注册处理器后用 `serve()` 启动，并用 `closeGracefully()` 有序关闭。 |
| [`ServerBuilder`](classes/serverbuilder/index.md) | 提供 Server 实例构建器。 |
| [`WebSocket`](classes/websocket/index.md) | 提供 WebSocket 服务的相关类，提供 WebSocket 连接的读、写、关闭等函数。 |
| [`WebSocketFrame`](classes/websocketframe/index.md) | WebSocket 用于读的基本单元。 |
| [`ConnectionException <: IOException`](classes/connectionexception/index.md) | Http 的 tcp 连接异常类。 |
| [`CoroutinePoolRejectException <: Exception`](classes/coroutinepoolrejectexception/index.md) | Http 的协程池拒绝请求处理异常类。 |
| [`HttpException <: Exception`](classes/httpexception/index.md) | Http 的通用异常类。 |
| [`HttpStatusException <: Exception`](classes/httpstatusexception/index.md) | Http 的响应状态异常类。 |
| [`HttpTimeoutException <: Exception`](classes/httptimeoutexception/index.md) | Http 的超时异常类。 |
| [`WebSocketException <: Exception`](classes/websocketexception/index.md) | WebSocket 的通用异常类。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`CookieJar`](interfaces/cookiejar/index.md) | CookieJar 是 Client 用来管理 Cookie 的工具。 |
| [`HttpRequestDistributor`](interfaces/httprequestdistributor/index.md) | Http request 分发器接口，将一个 request 按照 url 中的 path 分发给对应的 HttpRequestHandler 处理。 |
| [`HttpRequestHandler`](interfaces/httprequesthandler/index.md) | Http request 处理器。 |
| [`ProtocolServiceFactory`](interfaces/protocolservicefactory/index.md) | Http 服务实例工厂，用于生成 `ProtocolService` 实例。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`HttpStatusCode`](structs/httpstatuscode/index.md) | 用来表示网页服务器超文本传输协议响应状态的 3 位数字代码。 |
| [`ServicePoolConfig`](structs/servicepoolconfig/index.md) | Http Server 协程池配置。 |
| [`TransportConfig`](structs/transportconfig/index.md) | 传输层配置类，服务器建立连接使用的传输层配置。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`FileHandlerType`](enums/filehandlertype/index.md) | 用于设置 FileHandler 是上传还是下载模式。 |
| [`Protocol <: Equatable<Protocol> & ToString`](enums/protocol/index.md) | 定义 HTTP 协议类型枚举。 |
| [`WebSocketFrameType <: Equatable<WebSocketFrameType> & ToString`](enums/websocketframetype/index.md) | 定义 WebSocketFrame 的枚举类型。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`handleError(ctx: HttpContext, code: UInt16): Unit`](functions/handleerror-httpcontext-uint16.md) | 便捷的 Http 请求处理函数，用于回复错误请求。 |
| [`notFound(ctx: HttpContext): Unit`](functions/notfound-httpcontext.md) | 便捷的 Http 请求处理函数，用于回复 404 响应。 |
| [`upgrade(ctx: HttpContext): StreamingSocket`](functions/upgrade-httpcontext.md) | 在 handler 内获取 StreamingSocket，可用于支持协议升级和处理 CONNECT 请求。 |
