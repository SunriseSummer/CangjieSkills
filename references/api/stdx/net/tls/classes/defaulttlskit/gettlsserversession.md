<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.defaulttlskit.gettlsserversession" parent="stdx.net.tls.class.defaulttlskit" -->
# DefaultTlsKit.getTlsServerSession

[← DefaultTlsKit](index.md)

## 签名

```cangjie role=signature
public func getTlsServerSession(name: String): TlsSession
```

通过名称创建 TlsSession 实例，该名称用于区分 TLS 服务器。

## 参数

- name: String - 会话名称。

## 返回值

- TlsSession - 创建的 TlsSession 实例。

