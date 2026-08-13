<!-- cj-doc kind="api-member" level="6" id="std.net.class.udpsocket.disconnect" parent="std.net.class.udpsocket" -->
# UdpSocket.disconnect

[← UdpSocket](index.md)

## 签名

```cangjie role=signature
public func disconnect(): Unit
```

停止连接。

## 契约

功能：停止连接。取消仅收取特定对端报文。可在 `connect` 前调用，可多次调用。
