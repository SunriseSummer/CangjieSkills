<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.struct.tlsserverconfig.prop-maxversion" parent="stdx.net.tls.struct.tlsserverconfig" -->
# TlsServerConfig.maxVersion

[← TlsServerConfig](index.md)

## 签名

```cangjie role=signature
public mut prop maxVersion: TlsVersion
```

支持的 TLS 最大版本。

## 契约

> **注意**
>
> 当仅设置`maxVersion`，而未设置`minVersion`，或设置的`maxVersion`低于`minVersion`，将会在握手阶段抛出 TlsException。

类型：TlsVersion
