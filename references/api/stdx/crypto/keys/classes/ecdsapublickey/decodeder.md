<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.ecdsapublickey.decodeder" parent="stdx.crypto.keys.class.ecdsapublickey" -->
# ECDSAPublicKey.decodeDer

[← ECDSAPublicKey](index.md)

## 签名

```cangjie role=signature
public static func decodeDer(blob: DerBlob): ECDSAPublicKey
```

将公钥从 DER 格式解码。

## 契约

参数：

- blob: DerBlob - 二进制格式的公钥对象。

返回值：

- ECDSAPublicKey - 解码出的 ECDSA 公钥。

异常：

- CryptoException - 编码失败，抛出异常。
