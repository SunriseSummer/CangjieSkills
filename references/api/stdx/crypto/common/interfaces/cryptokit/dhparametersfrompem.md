<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.common.interface.cryptokit.dhparametersfrompem" parent="stdx.crypto.common.interface.cryptokit" -->
# CryptoKit.dhParametersFromPem

[← CryptoKit](index.md)

## 签名

```cangjie role=signature
func dhParametersFromPem(text: String): DHParameters
```

将 DH 密钥参数从 PEM 格式解码。

## 参数

- text: String - 待解码的 PEM 格式字符串。

## 返回值

- DHParameters - 解码得到的 DH 密钥参数。

