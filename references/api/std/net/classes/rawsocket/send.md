<!-- cj-doc kind="api-member" level="6" id="std.net.class.rawsocket.send" parent="std.net.class.rawsocket" -->
# RawSocket.send

[← RawSocket](index.md)

## 签名

```cangjie role=signature
public func send(buffer: Array<Byte>, flags: Int32): Unit
```

向连接的对端发送数据。

## 契约

参数：

- buffer: Array\<Byte> - 数据。
- flags: Int32 - 指定函数行为的标志。

异常：

- SocketException - 当前 RawSocket 实例已经关闭，或发送数据失败时，抛出异常。
- SocketTimeoutException - 当超过指定的写超时时间时，抛出异常。
