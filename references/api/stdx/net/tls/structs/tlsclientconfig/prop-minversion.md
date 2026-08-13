<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.struct.tlsclientconfig.prop-minversion" parent="stdx.net.tls.struct.tlsclientconfig" -->
# TlsClientConfig.minVersion

[← TlsClientConfig](index.md)

## 签名

```cangjie role=signature
public mut prop minVersion: TlsVersion
```

支持的 TLS 最小版本。

## 契约

> **注意**
> 当仅设置`minVersion`，而未设置`maxVersion`，或设置的`minVersion`高于`maxVersion`，将会在握手阶段抛出 TlsException。

类型：TlsVersion
