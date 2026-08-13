<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.class.x509certificate.decodefromder" parent="stdx.crypto.x509.class.x509certificate" -->
# X509Certificate.decodeFromDer

[← X509Certificate](index.md)

## 签名

```cangjie role=signature
public static func decodeFromDer(der: DerBlob): X509Certificate
```

将 DER 格式的数字证书解码。

## 契约

参数：

- der: DerBlob - DER 格式的二进制数据。

返回值：

- X509Certificate - 由 DER 格式解码出的数字证书。

异常：

- X509Exception - 数据为空时，或数据不是有效的数字证书 DER 格式时抛出异常。
