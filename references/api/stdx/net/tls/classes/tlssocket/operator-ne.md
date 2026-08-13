<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.tlssocket.operator-ne" parent="stdx.net.tls.class.tlssocket" -->
# TlsSocket.!=

[← TlsSocket](index.md)

## 签名

```cangjie role=signature
public override operator func !=(other: TlsSocket): Bool
```

判断两 TlsSocket 是否引用不同实例。

## 契约

参数：

- other: TlsSocket - 对比的 TLS 套接字。

返回值：

- Bool - 对比的套接字不同返回 `true`；否则，返回 `false`。
