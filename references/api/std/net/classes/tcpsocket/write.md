<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpsocket.write" parent="std.net.class.tcpsocket" -->
# TcpSocket.write

[← TcpSocket](index.md)

## 签名

```cangjie role=signature
public override func write(payload: Array<Byte>): Unit
```

写入报文。

## 契约

功能：写入报文。超时情况按 `writeTimeout` 决定，详见 `writeTimeout`。

参数：

- payload: Array\<Byte> - 存储写入数据的缓冲区。

异常：

- SocketException - 当 `buffer` 大小为 0 或者当因系统原因写入失败时，抛出异常。
