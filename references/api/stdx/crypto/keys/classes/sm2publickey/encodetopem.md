<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.sm2publickey.encodetopem" parent="stdx.crypto.keys.class.sm2publickey" -->
# SM2PublicKey.encodeToPem

[← SM2PublicKey](index.md)

## 签名

```cangjie role=signature
public func encodeToPem(): PemEntry
```

将公钥编码为 PEM 格式。

## 契约

返回值：

- PemEntry 对象。

异常：

- CryptoException - 编码失败，抛出异常。
