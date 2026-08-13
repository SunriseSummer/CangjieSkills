<!-- cj-doc kind="api-member" level="6" id="std.net.class.udpsocket.receive" parent="std.net.class.udpsocket" -->
# UdpSocket.receive

[← UdpSocket](index.md)

## 签名

```cangjie role=signature
public func receive(buffer: Array<Byte>): Int64
```

从 `connect` 连接到的地址收取报文。

## 契约

参数：

- buffer: Array\<Byte> - 存储收取到的报文的地址。

返回值：

- Int64 - 收取到的报文大小。
