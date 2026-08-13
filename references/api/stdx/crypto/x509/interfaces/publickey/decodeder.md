<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.interface.publickey.decodeder" parent="stdx.crypto.x509.interface.publickey" -->
# PublicKey.decodeDer

[← PublicKey](index.md)

## 签名

```cangjie role=signature
static func decodeDer(blob: DerBlob): PublicKey
```

将公钥从 DER 格式解码。

## 契约

参数：

- blob: DerBlob - DER 格式的公钥对象。

返回值：

- PublicKey - 由 DER 格式解码出的公钥。

异常：

- X509Exception - 当 DER 格式的公钥内容不正确，无法解析时抛出异常。
