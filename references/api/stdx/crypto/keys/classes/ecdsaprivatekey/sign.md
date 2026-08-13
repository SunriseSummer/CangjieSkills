<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.ecdsaprivatekey.sign" parent="stdx.crypto.keys.class.ecdsaprivatekey" -->
# ECDSAPrivateKey.sign

[← ECDSAPrivateKey](index.md)

## 签名

```cangjie role=signature
public func sign(digest: Array<Byte>): Array<Byte>
```

sign 对数据的摘要结果进行签名。

## 契约

参数：

- digest: Array\<Byte> - 数据的摘要结果。

返回值：

- Array\<Byte> - 签名后的数据。

异常：

- CryptoException - 签名失败，抛出异常。
