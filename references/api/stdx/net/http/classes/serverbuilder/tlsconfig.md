<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.tlsconfig" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.tlsConfig

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func tlsConfig(config: TlsServerConfig): ServerBuilder
```

设置 TLS 层配置，默认不对其进行设置。

## 契约

参数：

- config: TlsServerConfig - 设定支持 tls 服务所需要的配置信息。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
