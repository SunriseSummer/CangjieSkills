<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.websocketframe.prop-payload" parent="stdx.net.http.class.websocketframe" -->
# WebSocketFrame.payload

[← WebSocketFrame](index.md)

## 签名

```cangjie role=signature
public prop payload: Array<UInt8>
```

获取 WebSocketFrame 的帧载荷。

## 契约

功能：获取 WebSocketFrame 的帧载荷。如果是分段数据帧，用户需要在接收到完整的 message 后，将所有分段的 payload 按接收序拼接。

类型：Array\<UInt8>
