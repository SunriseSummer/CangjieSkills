<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.class.rsaprivatekey.decodeder" parent="stdx.crypto.keys.class.rsaprivatekey" -->
# RSAPrivateKey.decodeDer

[← RSAPrivateKey](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## static func decodeDer(DerBlob)

### 签名

```cangjie role=signature
public static func decodeDer(blob: DerBlob): RSAPrivateKey
```

将私钥从 DER 格式解码。

### 契约

参数：

- blob: DerBlob - 二进制格式的私钥对象。

返回值：

- RSAPrivateKey - 解码出的 RSA 私钥。

异常：

- CryptoException - 解码失败，抛出异常。

## static func decodeDer(DerBlob, ?String)

### 签名

```cangjie role=signature
public static func decodeDer(blob: DerBlob, password!: ?String): RSAPrivateKey
```

将加密的私钥从 DER 格式解码。

### 契约

参数：

- blob: DerBlob - 二进制格式的私钥对象。
- password!: ?String - 解密私钥需要提供的密码，密码为 None 时则不解密。

返回值：

- RSAPrivateKey - 解码出的 RSA 私钥。

异常：

- CryptoException - 解码失败、解密失败或者参数密码为空字符串，抛出异常。
