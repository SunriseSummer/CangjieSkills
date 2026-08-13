<!-- cj-doc kind="api-member" level="6" id="std.net.class.rawsocket.receive" parent="std.net.class.rawsocket" -->
# RawSocket.receive

[← RawSocket](index.md)

## 签名

```cangjie role=signature
public func receive(buffer: Array<Byte>, flags: Int32): Int64
```

接收来自连接对端发送的数据。

## 契约

参数：

- buffer: Array\<Byte> - 存储接收数据的数组。
- flags: Int32 - 指定函数行为的标志。

返回值：

- Int64 - 数据长度。

异常：

- SocketException - 当前 RawSocket 实例已经关闭，或接收数据失败时，抛出异常。
- SocketTimeoutException - 当超过指定的读超时时间时，抛出异常。
