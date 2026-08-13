<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.rsapublickey.verify" parent="stdx.crypto.keys.class.rsapublickey" -->
# RSAPublicKey.verify

[← RSAPublicKey](index.md)

## 签名

```cangjie role=signature
public func verify(hash: Digest, digest: Array<Byte>, sig: Array<Byte>, padType!: PadOption): Bool
```

verify 验证签名结果。

## 契约

参数：

- hash: Digest  - 摘要方法，获取 digest 结果使用的摘要方法。
- digest: Array\<Byte> - 数据的摘要结果。
- sig: Array\<Byte> - 数据的签名结果。
- padType!: PadOption - 填充模式，可以选择 PKCS1 或 PSS 模式，不支持 OAEP 模式，在对安全场景要求较高的情况下，推荐使用 PSS 填充模式。

返回值：

- Bool - 返回 true 表示验证成功，false 失败。

异常：

- CryptoException - 设置填充模式失败或验证失败，抛出异常。
