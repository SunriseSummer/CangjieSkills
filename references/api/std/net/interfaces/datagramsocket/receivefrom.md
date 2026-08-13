<!-- cj-doc kind="api-member" level="6" id="std.net.interface.datagramsocket.receivefrom" parent="std.net.interface.datagramsocket" -->
# DatagramSocket.receiveFrom

[← DatagramSocket](index.md)

## 签名

```cangjie role=signature
func receiveFrom(buffer: Array<Byte>): (SocketAddress, Int64)
```

阻塞式等待收取报文到 `buffer` 中。

## 契约

参数：

- buffer: Array\<Byte> - 存储报文内容的缓存空间，`buffer` 应当有一个合适的大小，否则可能导致收取报文时报文被截断，并且返回的报文大小值大于 `buffer` 的大小。

返回值：

- (SocketAddress, Int64) - 报文发送地址和收取到的报文大小（可能为 0，或大于参数 `buffer` 大小）。

异常：

- SocketException - 当本机缓存过小无法读取报文时，抛出异常。
- SocketTimeoutException - 当读取超时时，抛出异常。
