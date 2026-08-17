<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.kit.class.defaultcryptokit.publickeyfromder" parent="stdx.crypto.kit.class.defaultcryptokit" -->
# DefaultCryptoKit.publicKeyFromDer

[← DefaultCryptoKit](index.md)

## 签名

```cangjie role=signature
func publicKeyFromDer(encoded: DerBlob): PublicKey
```

将公钥从 DER 格式解码。

## 参数

- encoded: DerBlob - 待解码的 DerBlob 对象。

## 返回值

- PublicKey - 解码得到的公钥。

## 异常

- CryptoException - 编码文件中无有效信息时抛出异常。
- X509Exception - 解码失败时抛出异常。

