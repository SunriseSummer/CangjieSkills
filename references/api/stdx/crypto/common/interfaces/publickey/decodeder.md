<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.common.interface.publickey.decodeder" parent="stdx.crypto.common.interface.publickey" -->
# PublicKey.decodeDer

[← PublicKey](index.md)

## 签名

```cangjie role=signature
static func decodeDer(encoded: DerBlob): PublicKey
```

将公钥从 DER 格式解码。

## 参数

- encoded: DerBlob - DER 格式的公钥对象。

## 返回值

- PublicKey - 由 DER 格式解码出的公钥。

