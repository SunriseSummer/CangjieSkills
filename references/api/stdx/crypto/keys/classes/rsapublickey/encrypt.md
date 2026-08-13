<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.rsapublickey.encrypt" parent="stdx.crypto.keys.class.rsapublickey" -->
# RSAPublicKey.encrypt

[← RSAPublicKey](index.md)

## 签名

```cangjie role=signature
public func encrypt(input: InputStream, output: OutputStream, padType!: PadOption): Unit
```

encrypt 给一段数据进行加密。

## 契约

参数：

- input: InputStream - 需要加密的数据。
- output: OutputStream - 加密后的数据。
- padType!: PadOption - 填充模式，可以选择 PKCS1 或 OAEP 模式，不支持 PSS 模式，在对安全场景要求较高的情况下，推荐使用 OAEP 填充模式。

异常：

- CryptoException - 设置填充模式失败或加密失败，抛出异常。
