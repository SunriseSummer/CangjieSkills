<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.websocket.closeconn" parent="stdx.net.http.class.websocket" -->
# WebSocket.closeConn

[← WebSocket](index.md)

## 签名

```cangjie role=signature
public func closeConn(): Unit
```

提供关闭底层 WebSocket 连接的函数。

## 契约

> **说明：**
>
> 直接关闭底层连接。正常的关闭流程需要遵循协议规定的握手流程，即先发送 Close 帧给对端，并等待对端回应的 Close 帧。握手流程结束后方可关闭底层连接。
