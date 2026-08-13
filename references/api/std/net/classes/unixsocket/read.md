<!-- cj-doc kind="api-member" level="6" id="std.net.class.unixsocket.read" parent="std.net.class.unixsocket" -->
# UnixSocket.read

[← UnixSocket](index.md)

## 签名

```cangjie role=signature
public override func read(buffer: Array<Byte>): Int64
```

读取报文。

## 契约

功能：读取报文。超时情况按 `readTimeout` 决定，详见 `readTimeout`。

参数：

- buffer: Array\<Byte> - 读取的数据存储变量。

返回值：

- Int64 - 读取的数据长度。

异常：

- SocketException - 当 `buffer` 大小为 0 或者因系统原因读取失败时，抛出异常。
