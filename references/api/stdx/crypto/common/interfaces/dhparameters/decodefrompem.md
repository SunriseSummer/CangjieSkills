<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.common.interface.dhparameters.decodefrompem" parent="stdx.crypto.common.interface.dhparameters" -->
# DHParameters.decodeFromPem

[← DHParameters](index.md)

## 签名

```cangjie role=signature
static func decodeFromPem(text: String): DHParameters
```

将 DH 密钥参数从 PEM 格式解码。

## 参数

- text: String - PEM 格式的 DH 密钥参数字符流。

## 返回值

- DHParameters - 由 PEM 格式解码出的 DH 密钥参数。

