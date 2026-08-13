<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.interface.key.decodeder" parent="stdx.crypto.x509.interface.key" -->
# Key.decodeDer

[← Key](index.md)

## 签名

```cangjie role=signature
static func decodeDer(encoded: DerBlob): Key
```

将密钥从 DER 格式解码。

## 契约

参数：

- encoded: DerBlob - DER 格式的对象。

返回值：

- Key - 由 DER 格式解码出的密钥。

异常：

- X509Exception - 当 DER 格式的私钥内容不正确，无法解析时抛出异常。
