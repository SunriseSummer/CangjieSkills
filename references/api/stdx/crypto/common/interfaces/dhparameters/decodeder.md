<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.common.interface.dhparameters.decodeder" parent="stdx.crypto.common.interface.dhparameters" -->
# DHParameters.decodeDer

[← DHParameters](index.md)

## 签名

```cangjie role=signature
static func decodeDer(encoded: DerBlob): DHParameters
```

将 DH 密钥参数从 DER 格式解码。

## 说明
>
- DH（Diffie-Hellman）密钥交换协议是一种确保共享 KEY 安全穿越不安全网络的方法。
- DER 和 PEM 是两种常见的编码格式。

## 参数

- encoded: DerBlob - DER 格式的 DH 密钥参数对象。

## 返回值

- DHParameters - 由 DER 格式解码出的 DH 密钥参数。

