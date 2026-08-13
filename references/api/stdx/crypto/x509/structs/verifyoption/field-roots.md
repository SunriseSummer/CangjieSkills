<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.struct.verifyoption.field-roots" parent="stdx.crypto.x509.struct.verifyoption" -->
# VerifyOption.roots

[← VerifyOption](index.md)

## 签名

```cangjie role=signature
public var roots: Array<X509Certificate> = X509Certificate.systemRootCerts()
```

根证书链，默认为系统根证书链。

## 契约

类型：Array\<X509Certificate>
