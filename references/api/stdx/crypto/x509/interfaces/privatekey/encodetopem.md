<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.interface.privatekey.encodetopem" parent="stdx.crypto.x509.interface.privatekey" -->
# PrivateKey.encodeToPem

[← PrivateKey](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## func encodeToPem()

### 签名

```cangjie role=signature
override func encodeToPem(): PemEntry
```

将私钥编码成 PEM 格式。

### 契约

返回值：

- PemEntry - 编码后的 PEM 格式的私钥。

异常：

- X509Exception - 编码失败。

## func encodeToPem(?String)

### 签名

```cangjie role=signature
func encodeToPem(password!: ?String): PemEntry
```

将私钥加密编码成 PEM 格式，密码为 None 时则不加密。

### 契约

参数：

- password!: ?String - 加密密码。

返回值：

- PemEntry - 加密后的 PEM 格式的私钥。

异常：

- X509Exception - 加密失败，或者`password`为空字符串。
