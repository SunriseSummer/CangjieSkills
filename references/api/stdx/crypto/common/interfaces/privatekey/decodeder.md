<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.common.interface.privatekey.decodeder" parent="stdx.crypto.common.interface.privatekey" -->
# PrivateKey.decodeDer

[← PrivateKey](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
static func decodeDer(encoded: DerBlob): PrivateKey
```

将私钥从 DER 格式解码。

## 参数

- encoded: DerBlob - DER 格式的私钥对象。

## 返回值

- PrivateKey - 由 DER 格式解码出的私钥。

## 重载 2

### 签名

```cangjie role=signature
static func decodeDer(encoded: DerBlob, password!: ?String): PrivateKey
```

将 DER 格式的私钥解密解码成 PrivateKey 对象，密码为 None 时则不解密。

## 参数

- encoded: DerBlob - DER 格式的私钥。
- password!: ?String - 解密密码。

## 返回值

- PrivateKey - 解密解码后的私钥对象。

