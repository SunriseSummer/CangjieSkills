<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.common.interface.privatekey.decodefrompem" parent="stdx.crypto.common.interface.privatekey" -->
# PrivateKey.decodeFromPem

[← PrivateKey](index.md)

本页汇总 2 个同名重载。

## 重载 1

### 签名

```cangjie role=signature
static func decodeFromPem(text: String): PrivateKey
```

将私钥从 PEM 格式解码。

## 参数

- text: String - PEM 格式的私钥字符流。

## 返回值

- PrivateKey - 由 PEM 格式解码出的私钥。

## 重载 2

### 签名

```cangjie role=signature
static func decodeFromPem(text: String, password!: ?String): PrivateKey
```

将 PEM 格式的私钥解密解码成 PrivateKey 对象，密码为 None 时则不解密。

## 参数

- text: String - PEM 格式的私钥。
- password!: ?String - 解密密码。

## 返回值

- PrivateKey - 解密解码后的私钥对象。

