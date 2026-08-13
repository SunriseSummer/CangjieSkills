<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.ecdsaprivatekey.encodetoder" parent="stdx.crypto.keys.class.ecdsaprivatekey" -->
# ECDSAPrivateKey.encodeToDer

[← ECDSAPrivateKey](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func encodeToDer()

### 签名

```cangjie role=signature
public override func encodeToDer(): DerBlob
```

将私钥编码为 DER 格式。

### 契约

返回值：

- DerBlob - 编码后的 Der 格式私钥。

异常：

- CryptoException - 编码失败，抛出异常。

## func encodeToDer(?String)

### 签名

```cangjie role=signature
public func encodeToDer(password!: ?String): DerBlob
```

使用 AES-256-CBC 加密私钥，将私钥编码为 DER 格式。

### 契约

参数：

- password!: ?String - 加密私钥需要提供的密码，密码为 None 时则不加密。

返回值：

- DerBlob - 编码后的 DER 格式私钥。

异常：

- CryptoException - 编码失败、加密失败或者参数密码为空字符串，抛出异常。
