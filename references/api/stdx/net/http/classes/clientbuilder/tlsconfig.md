<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.clientbuilder.tlsconfig" parent="stdx.net.http.class.clientbuilder" -->
# ClientBuilder.tlsConfig

[← ClientBuilder](index.md)

## 签名

```cangjie role=signature
public func tlsConfig(config: TlsClientConfig): ClientBuilder
```

设置 TLS 层配置，默认不对其进行设置。

## 契约

参数：

- config: TlsClientConfig - 设定支持 tls 客户端需要的配置信息。

返回值：

- ClientBuilder - 当前 ClientBuilder 实例的引用。
