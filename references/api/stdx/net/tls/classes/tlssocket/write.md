<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.write" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.write

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public func write(buffer: Array<Byte>): Unit
```

TlsSocket 发送数据。

## 契约

参数：

- buffer: Array\<Byte> - 存储将要发送的数据内容数组。

异常：

- SocketException - 本端建连的底层 TCP 套接字关闭，抛出异常。
- TlsException - 当套接字已关闭，或者 TlsSocket 未连接，或写入数据出现系统错误等。
