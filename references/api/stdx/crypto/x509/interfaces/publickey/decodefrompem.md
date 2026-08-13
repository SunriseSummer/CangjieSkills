<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.interface.publickey.decodefrompem" parent="stdx.crypto.x509.interface.publickey" -->
# PublicKey.decodeFromPem

[← PublicKey](index.md)

## 签名

```cangjie role=signature
static func decodeFromPem(text: String): PublicKey
```

将公钥从 PEM 格式解码。

## 契约

参数：

- text: String - PEM 格式的公钥字符流。

返回值：

- PublicKey - 由 PEM 格式解码出的公钥。

异常：

- X509Exception - 字符流不符合 PEM 格式，或文件头不符合公钥头标准时抛出异常。
