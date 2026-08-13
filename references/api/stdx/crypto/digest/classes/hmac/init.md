<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.digest.class.hmac.init" parent="stdx.crypto.digest.class.hmac" -->
# HMAC.init

[← HMAC](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## init(Array<Byte>, () -> Digest)

### 签名

```cangjie role=signature
public init(key: Array<Byte>, digest: () -> Digest)
```

构造函数，创建 HMAC 对象。

### 契约

参数：

- key: Array\<Byte> - 密钥，建议该参数不小于所选 Hash 算法摘要的长度。
- digest: () -> Digest - hash 算法。

异常：

- CryptoException - key 值为空时，抛出异常。

## init(Array<Byte>, HashType)

### 签名

```cangjie role=signature
public init(key: Array<Byte>, algorithm: HashType)
```

构造函数，创建 HMAC 对象。

### 契约

参数：

- key: Array\<Byte> - 密钥，建议该参数不小于所选 Hash 算法摘要的长度。
- algorithm: HashType - hash 算法。

异常：

- CryptoException - key 值为空时，抛出异常。
