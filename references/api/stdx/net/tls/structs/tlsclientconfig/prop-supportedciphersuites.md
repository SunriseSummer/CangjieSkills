<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.struct.tlsclientconfig.prop-supportedciphersuites" parent="stdx.net.tls.struct.tlsclientconfig" -->
# TlsClientConfig.supportedCipherSuites

[← TlsClientConfig](index.md)

## 签名

```cangjie role=signature
public mut prop supportedCipherSuites: Map<TlsVersion, Array<String>>
```

设置或获取每个 TLS 版本对应的密码套件。

类型：Map<TlsVersion, Array<String>>

## 异常

- IllegalArgumentException - 通过传入 `Map` 设置密码套件时，某个 TLS 版本对应的密码套件字符串中包含空字符 `\0`，则抛出异常。

