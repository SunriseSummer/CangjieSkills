<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.rsapublickey.init" parent="stdx.crypto.keys.class.rsapublickey" -->
# RSAPublicKey.init

[← RSAPublicKey](index.md)

## 签名

```cangjie role=signature
public init(pri: RSAPrivateKey)
```

init 初始化公钥，从私钥中获取对应的公钥。

## 契约

参数：

- pri: RSAPrivateKey - RSA 私钥。

异常：

- CryptoException - 初始化失败，抛出异常。
