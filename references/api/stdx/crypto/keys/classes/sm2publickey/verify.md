<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.sm2publickey.verify" parent="stdx.crypto.keys.class.sm2publickey" -->
# SM2PublicKey.verify

[← SM2PublicKey](index.md)

## 签名

```cangjie role=signature
public func verify(data: Array<Byte>, sig: Array<Byte>): Bool
```

verify 验证签名结果。

## 契约

参数：

- data: Array\<Byte> - 数据。
- sig: Array\<Byte> - 数据的签名结果。

返回值：

- Bool - 返回 true 表示验证成功，false 失败。

异常：

- CryptoException - 设置填充模式失败或验证失败，抛出异常。
