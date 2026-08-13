<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.class.x509certificate.systemrootcerts" parent="stdx.crypto.x509.class.x509certificate" -->
# X509Certificate.systemRootCerts

[← X509Certificate](index.md)

## 签名

```cangjie role=signature
public static func systemRootCerts(): Array<X509Certificate>
```

返回操作系统的根证书，支持 Linux，MacOS 和 Windows 平台。

## 契约

返回值：

- Array\<X509Certificate> - 操作系统的根证书链。
