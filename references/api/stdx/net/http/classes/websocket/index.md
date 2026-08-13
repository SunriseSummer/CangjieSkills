<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.websocket" parent="stdx.net.http" -->
# WebSocket

[← stdx.net.http](../../index.md)

`WebSocket`

提供 WebSocket 服务的相关类，提供 WebSocket 连接的读、写、关闭等函数。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`logger: Logger`](prop-logger.md) | 日志记录器。 |
| [`subProtocol: String`](prop-subprotocol.md) | 获取与对端协商到的 subProtocol，协商时，客户端提供一个按偏好排名的 subProtocols 列表，服务器从中选取一个或零个子协议。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static upgradeFromClient(client: Client, url: URL, version!: Protocol = HTTP1_1, subProtocols!: ArrayList<String> = ArrayList<String>(), headers!: HttpHeaders = HttpHeaders()): (WebSocket, HttpHeaders)`](upgradefromclient.md) | 提供客户端升级到 WebSocket 协议的函数。 |
| [`static upgradeFromServer(ctx: HttpContext, subProtocols!: ArrayList<String> = ArrayList<String>(), origins!: ArrayList<String> = ArrayList<String>(), userFunc!:(HttpRequest) -> HttpHeaders = {_: HttpRequest => HttpHeaders()}): WebSocket`](upgradefromserver.md) | 提供服务端升级到 WebSocket 协议的函数，通常在 handler 中使用。 |
| [`closeConn(): Unit`](closeconn.md) | 提供关闭底层 WebSocket 连接的函数。 |
| [`read(): WebSocketFrame`](read.md) | 从连接中读取一个帧，如果连接上数据未就绪会阻塞，非线程安全（即对同一个 WebSocket 对象不支持多线程读）。 |
| [`write(frameType: WebSocketFrameType, byteArray: Array<UInt8>, frameSize!: Int64 = FRAMESIZE): Unit`](write.md) | 发送数据，非线程安全（即对同一个 WebSocket 对象不支持多线程写）。 |
| [`writeCloseFrame(status!: ?UInt16 = None, reason!: String = ""): Unit`](writecloseframe.md) | 发送 Close 帧。 |
| [`writePingFrame(byteArray: Array<UInt8>): Unit`](writepingframe.md) | 提供发送 Ping 帧的快捷函数，closeConn 关闭连接后调用写，抛出异常。 |
| [`writePongFrame(byteArray: Array<UInt8>): Unit`](writepongframe.md) | 提供发送 Pong 帧的快捷函数，closeConn 关闭连接后调用写，抛出异常。 |
