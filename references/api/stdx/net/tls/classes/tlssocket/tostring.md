<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.tostring" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.toString

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public func toString(): String
```

套接字的字符串表示，字符串内容为当前套接字状态。

## 契约

> **说明：**
>
> 例如：当前套接字处于可开始进行握手状态时，该接口将返回字符串 "TlsSocket(TcpSocket(\${本端地址} -> \${对端地址}), ready for handshake)"

返回值：

- String - 该 TLS 连接字符串。
