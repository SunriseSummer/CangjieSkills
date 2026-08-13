<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.sm2publickey.decodeder" parent="stdx.crypto.keys.class.sm2publickey" -->
# SM2PublicKey.decodeDer

[← SM2PublicKey](index.md)

## 签名

```cangjie role=signature
public static func decodeDer(blob: DerBlob): SM2PublicKey
```

将公钥从 DER 格式解码。

## 契约

参数：

- blob: DerBlob - 二进制格式的公钥对象。

返回值：

- SM2PublicKey - 解码出的 SM2 公钥。

异常：

- CryptoException - 解码失败，抛出异常。
