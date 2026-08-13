<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.interface.privatekey.decodefrompem" parent="stdx.crypto.x509.interface.privatekey" -->
# PrivateKey.decodeFromPem

[← PrivateKey](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func decodeFromPem(String)

### 签名

```cangjie role=signature
static func decodeFromPem(text: String): PrivateKey
```

将私钥从 PEM 格式解码。

### 契约

参数：

- text: String - PEM 格式的私钥字符流。

返回值：

- PrivateKey - 由 PEM 格式解码出的私钥。

异常：

- X509Exception - 字符流不符合 PEM 格式，或文件头不符合公钥头标准时抛出异常。

## static func decodeFromPem(String, ?String)

### 签名

```cangjie role=signature
static func decodeFromPem(text: String, password!: ?String): PrivateKey
```

将 PEM 格式的私钥解密解码成 PrivateKey 对象，密码为 None 时则不解密。

### 契约

参数：

- text: String - PEM 格式的私钥。
- password!: ?String - 解密密码。

返回值：

- PrivateKey - 解密解码后的私钥对象。

异常：

- X509Exception - 解密解码失败，或者`password`为空字符串。
