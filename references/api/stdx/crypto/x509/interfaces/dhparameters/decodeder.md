<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.interface.dhparameters.decodeder" parent="stdx.crypto.x509.interface.dhparameters" -->
# DHParameters.decodeDer

[← DHParameters](index.md)

## 签名

```cangjie role=signature
static func decodeDer(blob: DerBlob): DHParameters
```

将 DH 密钥参数从 DER 格式解码。

## 契约

> **说明：**
>
> - DH（Diffie-Hellman）密钥交换协议是一种确保共享 KEY 安全穿越不安全网络的方法。
> - DER 和 PEM 是两种常见的编码格式。

参数：

- blob: DerBlob - DER 格式的 DH 密钥参数对象。

返回值：

- DHParameters - 由 DER 格式解码出的 DH 密钥参数。

异常：

- X509Exception - 当 DER 格式的 DH 密钥参数内容不正确，无法解析时抛出异常。
