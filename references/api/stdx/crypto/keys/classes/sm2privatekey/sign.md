<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.sm2privatekey.sign" parent="stdx.crypto.keys.class.sm2privatekey" -->
# SM2PrivateKey.sign

[← SM2PrivateKey](index.md)

## 签名

```cangjie role=signature
public func sign(data: Array<Byte>): Array<Byte>
```

sign 对数据进行签名，SM2 采用 SM3 数据摘要算法。

## 契约

参数：

- data: Array\<Byte> - 数据。

返回值：

- Array\<Byte> - 签名后的数据。

异常：

- CryptoException - 签名失败，抛出异常。
