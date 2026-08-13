<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.class.websocketframe" parent="stdx.net.http" -->
# WebSocketFrame

[← stdx.net.http](../../index.md)

`WebSocketFrame`

WebSocket 用于读的基本单元。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`fin: Bool`](prop-fin.md) | 获取 WebSocketFrame 的 fin 属性，fin 与 frameType 共同说明了帧是否分段和帧的类型。 |
| [`frameType: WebSocketFrameType`](prop-frametype.md) | 获取 WebSocketFrame 的帧类型，fin 与 frameType 共同说明了帧是否分段和帧的类型。 |
| [`payload: Array<UInt8>`](prop-payload.md) | 获取 WebSocketFrame 的帧载荷。 |
