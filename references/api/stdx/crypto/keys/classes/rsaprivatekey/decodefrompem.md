<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.rsaprivatekey.decodefrompem" parent="stdx.crypto.keys.class.rsaprivatekey" -->
# RSAPrivateKey.decodeFromPem

[← RSAPrivateKey](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func decodeFromPem(String)

### 签名

```cangjie role=signature
public static func decodeFromPem(text: String): RSAPrivateKey
```

将私钥从 PEM 格式解码。

### 契约

参数：

- text: String - PEM 格式的私钥字符流。

返回值：

- RSAPrivateKey - 解码出的 RSA 私钥。

异常：

- CryptoException - 解码失败、解密失败、字符流不符合 PEM 格式或文件头不符合私钥头标准时，抛出异常。

## static func decodeFromPem(String, ?String)

### 签名

```cangjie role=signature
public static func decodeFromPem(text: String, password!: ?String): RSAPrivateKey
```

将私钥从 PEM 格式解码。

### 契约

参数：

- text: String - PEM 格式的私钥字符流。
- password!: ?String - 解密私钥需要提供的密码，密码为 None 时则不解密。

返回值：

- RSAPrivateKey - 解码出的 RSA 私钥。

异常：

- CryptoException - 解码失败、解密失败、参数密码为空字符串、字符流不符合 PEM 格式或文件头不符合私钥头标准时，抛出异常。
