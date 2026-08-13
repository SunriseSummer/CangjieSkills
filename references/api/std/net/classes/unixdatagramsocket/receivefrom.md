<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixdatagramsocket.receivefrom" parent="std.net.class.unixdatagramsocket" -->
# UnixDatagramSocket.receiveFrom

[← UnixDatagramSocket](index.md)

## 签名

```cangjie role=signature
public override func receiveFrom(buffer: Array<Byte>): (SocketAddress, Int64)
```

收取报文。

## 契约

参数：

- buffer: Array\<Byte> - 存储收取到报文的地址。

返回值：

- (SocketAddress, Int64) - 收取到的报文的发送端地址，及实际收取到的报文大小，可能为 0 或者大于参数 `buffer` 的大小。

异常：

- SocketException - 本机缓存过小无法读取报文时，抛出异常。
- SocketTimeoutException - 当读取超时时，抛出异常。
