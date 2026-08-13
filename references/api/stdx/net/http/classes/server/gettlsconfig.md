<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.server.gettlsconfig" parent="stdx.net.http.class.server" -->
# Server.getTlsConfig

[← Server](index.md)

## 签名

```cangjie role=signature
public func getTlsConfig(): ?TlsServerConfig
```

获取服务器设定的 TLS 层配置。

## 契约

返回值：

- ?TlsServerConfig - 服务端设定的 TLS 层配置，如果没有设置则返回 None。
