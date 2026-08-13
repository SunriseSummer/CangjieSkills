<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.sm2privatekey.encodetopem" parent="stdx.crypto.keys.class.sm2privatekey" -->
# SM2PrivateKey.encodeToPem

[← SM2PrivateKey](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func encodeToPem(?String)

### 签名

```cangjie role=signature
public func encodeToPem(password!: ?String): PemEntry
```

将加密的私钥编码为 PEM 格式。

### 契约

参数：

- password!: ?String - 加密私钥需要提供的密码，密码为 None 时则不加密。

返回值：

- PemEntry - 私钥 PEM 格式的对象。

异常：

- CryptoException - 编码失败、加密失败或者参数密码为空字符串，抛出异常。

## func encodeToPem()

### 签名

```cangjie role=signature
public func encodeToPem(): PemEntry
```

将私钥编码为 PEM 格式。

### 契约

返回值：

- PemEntry - 私钥 PEM 格式的对象。

异常：

- CryptoException - 编码失败，抛出异常。
