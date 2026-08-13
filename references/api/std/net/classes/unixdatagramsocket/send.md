<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixdatagramsocket.send" parent="std.net.class.unixdatagramsocket" -->
# UnixDatagramSocket.send

[← UnixDatagramSocket](index.md)

## 签名

```cangjie role=signature
public func send(payload: Array<Byte>): Unit
```

发送报文到 `connect` 连接到的地址。

## 契约

参数：

- payload: Array\<Byte> - 发送报文内容。

异常：

- SocketException - 当 `payload` 的大小超出系统限制或者系统发送失败时，抛出异常。
