<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.ecdsaprivatekey.init" parent="stdx.crypto.keys.class.ecdsaprivatekey" -->
# ECDSAPrivateKey.init

[← ECDSAPrivateKey](index.md)

## 签名

```cangjie role=signature
public init(curve: Curve)
```

init 初始化生成私钥。

## 契约

参数：

- curve: Curve - 椭圆曲线类型。

异常：

- CryptoException - 初始化失败，抛出异常。
