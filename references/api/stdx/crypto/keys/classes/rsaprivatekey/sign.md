<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.rsaprivatekey.sign" parent="stdx.crypto.keys.class.rsaprivatekey" -->
# RSAPrivateKey.sign

[← RSAPrivateKey](index.md)

## 签名

```cangjie role=signature
public func sign(hash: Digest, digest: Array<Byte>, padType!: PadOption): Array<Byte>
```

对数据的摘要结果进行签名。

## 契约

参数：

- hash: Digest - 摘要方法，获取 digest 结果使用的摘要方法。
- digest: Array\<Byte> - 数据的摘要结果。
- padType!: PadOption - 填充模式，可以选择 PKCS1 或 PSS 模式，不支持 OAEP 模式，在对安全场景要求较高的情况下，推荐使用 PSS 填充模式。

返回值：

- Array\<Byte> - 签名后的数据。

异常：

- CryptoException - 设置摘要方法失败、设置填充模式失败或签名失败，抛出异常。
