<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.enum.websocketframetype" parent="stdx.net.http" -->
# WebSocketFrameType

[← stdx.net.http](../../index.md)

`WebSocketFrameType <: Equatable<WebSocketFrameType> & ToString`

定义 WebSocketFrame 的枚举类型。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`ContinuationWebFrame`](value-continuationwebframe.md) | 定义 websocket 协议中的未结束的分片帧。 |
| [`TextWebFrame`](value-textwebframe.md) | 定义 websocket 协议中的文本帧。 |
| [`BinaryWebFrame`](value-binarywebframe.md) | 定义 websocket 协议中的数据帧。 |
| [`CloseWebFrame`](value-closewebframe.md) | 定义 websocket 协议中的关闭帧。 |
| [`PingWebFrame`](value-pingwebframe.md) | 定义 websocket 协议中的心跳帧。 |
| [`PongWebFrame`](value-pongwebframe.md) | 定义 websocket 协议中的心跳帧。 |
| [`UnknownWebFrame`](value-unknownwebframe.md) | 定义 websocket 协议中的未知类型帧。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override toString(): String`](tostring.md) | 获取 WebSocket 帧类型字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator !=(that: WebSocketFrameType): Bool`](operator-ne.md) | 判断枚举值是否不相等。 |
| [`override operator ==(that: WebSocketFrameType): Bool`](operator-eq.md) | 判断枚举值是否相等。 |
