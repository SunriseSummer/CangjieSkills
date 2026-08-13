<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.read" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.read

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public override func read(buffer: Array<Byte>): Int64
```

TlsSocket 读取数据。

## 契约

参数：

- buffer: Array\<Byte> - 存储读取到的数据内容的数组。

返回值：

- Int64 - 读取到的数据内容字节数。

异常：

- SocketException - 本端建连的底层 TCP 套接字关闭，抛出异常。
- TlsException - 当 `buffer` 为空，或者 TlsSocket 未连接，或读取数据出现系统错误等。
