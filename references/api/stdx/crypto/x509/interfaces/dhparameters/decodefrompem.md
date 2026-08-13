<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.interface.dhparameters.decodefrompem" parent="stdx.crypto.x509.interface.dhparameters" -->
# DHParameters.decodeFromPem

[← DHParameters](index.md)

## 签名

```cangjie role=signature
static func decodeFromPem(text: String): DHParameters
```

将 DH 密钥参数从 PEM 格式解码。

## 契约

> **说明：**
>
> PEM 是用 ASCLL(BASE64) 编码的证书。

参数：

- text: String - PEM 格式的 DH 密钥参数字符流。

返回值：

- DHParameters - 由 PEM 格式解码出的 DH 密钥参数。

异常：

- X509Exception - 字符流不符合 PEM 格式，或文件头不符合 DH 密钥参数头标准（"-----BEGIN DH PARAMETERS-----"）时抛出异常。
