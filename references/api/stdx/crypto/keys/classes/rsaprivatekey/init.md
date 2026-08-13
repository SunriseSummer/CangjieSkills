<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.rsaprivatekey.init" parent="stdx.crypto.keys.class.rsaprivatekey" -->
# RSAPrivateKey.init

[← RSAPrivateKey](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init(Int32)

### 签名

```cangjie role=signature
public init(bits: Int32)
```

init 初始化生成私钥，公钥指数默认值为 65537，业界推荐。

### 契约

功能：init 初始化生成私钥，公钥指数默认值为 65537，业界推荐。公钥指数 e 的大小直接影响了 RSA 算法的安全性和加密效率。通常情况下，e 的值越小，加密速度越快，但安全性越低。

参数：

- bits: Int32 - 密钥长度，需要大于等于 512 位，并且小于等于 16384 位。

异常：

- CryptoException - 密钥长度不符合要求或初始化失败，抛出异常。

## init(Int32, BigInt)

### 签名

```cangjie role=signature
public init(bits: Int32, e: BigInt)
```

init 初始化生成私钥，允许用户指定公共指数。

### 契约

参数：

- bits: Int32 - 密钥长度，需要大于等于 512 位，并且小于等于 16384 位，推荐使用的密钥长度不小于 3072 位。
- e: BigInt - 公钥公共指数，范围是 [3, 2^256-1] 的奇数。

异常：

- CryptoException - 密钥长度不符合要求、公钥公共指数值不符合要求或初始化失败，抛出异常。
