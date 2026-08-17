<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.kit.class.defaultcryptokit.certificatefromder" parent="stdx.crypto.kit.class.defaultcryptokit" -->
# DefaultCryptoKit.certificateFromDer

[← DefaultCryptoKit](index.md)

## 签名

```cangjie role=signature
func certificateFromDer(encoded: DerBlob): Certificate
```

将证书从 DER 格式解码。

## 参数

- encoded: DerBlob - 待解码的 DerBlob 对象。

## 返回值

- Certificate - 解码得到的证书。

## 异常

- CryptoException - 编码文件中无有效信息时抛出异常。
- X509Exception - 解码失败时抛出异常。

