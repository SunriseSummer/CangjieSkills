<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.interface.dhparameters.encodetopem" parent="stdx.crypto.x509.interface.dhparameters" -->
# DHParameters.encodeToPem

[← DHParameters](index.md)

## 签名

```cangjie role=signature
override func encodeToPem(): PemEntry
```

将 DH 密钥参数编码为 PEM 格式。

## 契约

返回值：

- PemEntry - DH 密钥参数数据 PEM 格式编码生成的对象。
