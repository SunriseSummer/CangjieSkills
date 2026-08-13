<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.websocket.writepingframe" parent="stdx.net.http.class.websocket" -->
# WebSocket.writePingFrame

[← WebSocket](index.md)

## 签名

```cangjie role=signature
public func writePingFrame(byteArray: Array<UInt8>): Unit
```

提供发送 Ping 帧的快捷函数，closeConn 关闭连接后调用写，抛出异常。

## 契约

参数：

- byteArray: Array\<UInt8> - 所需发送的帧的 payload（二进制形式）。

异常：

- SocketException - 底层连接错误时抛出异常。
- WebSocketException - 传入的数据大于 125 bytes，抛出异常。
