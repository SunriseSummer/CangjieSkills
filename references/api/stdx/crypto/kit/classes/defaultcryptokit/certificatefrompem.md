<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.kit.class.defaultcryptokit.certificatefrompem" parent="stdx.crypto.kit.class.defaultcryptokit" -->
# DefaultCryptoKit.certificateFromPem

[← DefaultCryptoKit](index.md)

## 签名

```cangjie role=signature
func certificateFromPem(text: String): Array<Certificate>
```

将证书从 PEM 格式解码。

## 参数

- text: String - 待解码的 PEM 格式字符串。

## 返回值

- Array<Certificate> - 解码得到的证书集合。

## 异常

- CryptoException - 编码文件中无有效信息时抛出异常。
- X509Exception - 解码失败时抛出异常。

