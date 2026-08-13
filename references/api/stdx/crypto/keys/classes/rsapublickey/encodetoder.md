<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.rsapublickey.encodetoder" parent="stdx.crypto.keys.class.rsapublickey" -->
# RSAPublicKey.encodeToDer

[← RSAPublicKey](index.md)

## 签名

```cangjie role=signature
public override func encodeToDer(): DerBlob
```

将公钥编码为 DER 格式。

## 契约

返回值：

- DerBlob - 编码后的 Der 格式公钥。

异常：

- CryptoException - 编码失败，抛出异常。
