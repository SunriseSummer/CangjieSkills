<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.rsaprivatekey.encodetopem" parent="stdx.crypto.keys.class.rsaprivatekey" -->
# RSAPrivateKey.encodeToPem

[← RSAPrivateKey](index.md)

## 签名

```cangjie role=signature
public override func encodeToPem(): PemEntry
```

将私钥编码为 PEM 格式。

## 契约

返回值：

- PemEntry - 私钥 PEM 格式的对象。

异常：

- CryptoException - 编码失败，抛出异常。
