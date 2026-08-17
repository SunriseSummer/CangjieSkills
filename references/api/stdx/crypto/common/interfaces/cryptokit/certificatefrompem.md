<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.common.interface.cryptokit.certificatefrompem" parent="stdx.crypto.common.interface.cryptokit" -->
# CryptoKit.certificateFromPem

[← CryptoKit](index.md)

## 签名

```cangjie role=signature
func certificateFromPem(text: String): Array<Certificate>
```

将证书从 PEM 格式解码。

## 参数

- text: String - 待解码的 PEM 格式字符串。

## 返回值

- Array<Certificate> - 解码得到的证书集合。

