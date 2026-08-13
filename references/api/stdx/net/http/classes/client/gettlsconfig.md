<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.client.gettlsconfig" parent="stdx.net.http.class.client" -->
# Client.getTlsConfig

[← Client](index.md)

## 签名

```cangjie role=signature
public func getTlsConfig(): ?TlsClientConfig
```

获取客户端设定的 TLS 层配置。

## 契约

返回值：

- ?TlsClientConfig - 客户端设定的 TLS 层配置，如果没有设置则返回 None。
