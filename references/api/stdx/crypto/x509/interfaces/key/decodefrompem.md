<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.interface.key.decodefrompem" parent="stdx.crypto.x509.interface.key" -->
# Key.decodeFromPem

[← Key](index.md)

## 签名

```cangjie role=signature
static func decodeFromPem(text: String): Key
```

将密钥从 PEM 格式解码。

## 契约

参数：

- text: String - PEM 格式的字符流。

返回值：

- Key - 由 PEM 格式解码出的密钥。
