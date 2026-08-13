<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.class.x509certificate.decodefrompem" parent="stdx.crypto.x509.class.x509certificate" -->
# X509Certificate.decodeFromPem

[← X509Certificate](index.md)

## 签名

```cangjie role=signature
public static func decodeFromPem(pem: String): Array<X509Certificate>
```

将数字证书从 PEM 格式解码。

## 契约

参数：

- pem: String - PEM 格式的数字证书字符流。

返回值：

- Array\<X509Certificate> - 由 PEM 格式解码出的数字证书数组。

异常：

- X509Exception - 字符流不符合 PEM 格式时，或文件头不符合数字证书头标准时抛出异常。
