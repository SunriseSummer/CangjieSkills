<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixdatagramsocket.disconnect" parent="std.net.class.unixdatagramsocket" -->
# UnixDatagramSocket.disconnect

[← UnixDatagramSocket](index.md)

## 签名

```cangjie role=signature
public func disconnect(): Unit
```

停止连接。

## 契约

功能：停止连接。取消仅收取特定对端报文。可在 `connect` 前调用，可多次调用。

异常：

- SocketException - 当未绑定时，抛出异常。
