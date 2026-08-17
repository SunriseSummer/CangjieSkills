<!-- cj-doc kind="api-member" level="6" id="stdx.net.tls.class.keylesstlsserverconfig.init" parent="stdx.net.tls.class.keylesstlsserverconfig" -->
# KeylessTlsServerConfig.init

[← KeylessTlsServerConfig](index.md)

## 签名

```cangjie role=signature
public init(certChain: Array<X509Certificate>, signCallback: KeylessSignFunc, decryptCallback!: ?KeylessDecryptFunc = None<KeylessDecryptFunc>)
```

构造 KeylessTlsServerConfig 对象。

## 参数

- certChain: Array<X509Certificate> - 证书对象。
- signCallback: KeylessSignFunc - 签名回调函数。
- decryptCallback!: ?KeylessDecryptFunc - 解密回调函数，默认为 None<KeylessDecryptFunc>。

## 异常

- IllegalArgumentException - 当 `certChain` 为空时，抛出异常。

