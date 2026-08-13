<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.interface.privatekey.decodeder" parent="stdx.crypto.x509.interface.privatekey" -->
# PrivateKey.decodeDer

[← PrivateKey](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func decodeDer(DerBlob)

### 签名

```cangjie role=signature
static func decodeDer(blob: DerBlob): PrivateKey
```

将私钥从 DER 格式解码。

### 契约

参数：

- blob: DerBlob - DER 格式的私钥对象。

返回值：

- PrivateKey - 由 DER 格式解码出的私钥。

异常：

- X509Exception - 当 DER 格式的私钥内容不正确，无法解析时抛出异常。

## static func decodeDer(DerBlob, ?String)

### 签名

```cangjie role=signature
static func decodeDer(blob: DerBlob, password!: ?String): PrivateKey
```

将 DER 格式的私钥解密解码成 PrivateKey 对象，密码为 None 时则不解密。

### 契约

参数：

- blob: DerBlob - DER 格式的私钥。
- password!: ?String - 解密密码。

返回值：

- PrivateKey - 解密解码后的私钥对象。

异常：

- X509Exception - 解密解码失败，或者`password`为空字符串。
