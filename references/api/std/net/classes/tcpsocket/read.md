<!-- cj-doc kind="api-member" level="6" id="std.net.class.tcpsocket.read" parent="std.net.class.tcpsocket" -->
# TcpSocket.read

[← TcpSocket](index.md)

## 签名

```cangjie role=signature
public override func read(buffer: Array<Byte>): Int64
```

读取报文。

## 契约

功能：读取报文。超时情况按 `readTimeout` 决定，详见 `readTimeout`。

> **说明：**
>
> - 由于系统底层接口差异，如果连接被对端关闭，`read` 和 `write` 接口的行为也有相应的差异。
> - Windows 系统上，对端关闭连接后，如果本端调用一次 `write`，会导致清空缓冲区内容，在此基础上再调用 `read` 会抛出连接关闭异常。
> - Linux/macOS 系统上，对端关闭连接后，先调用 `write` 再调用 `read` 函数仍会读出缓冲区中的内容。

参数：

- buffer: Array\<Byte> - 存储读出数据的缓冲区。

返回值：

- Int64 - 读取的数据长度。

异常：

- SocketException - 当 `buffer` 大小为 0 或者因系统原因读取失败时，抛出异常。
