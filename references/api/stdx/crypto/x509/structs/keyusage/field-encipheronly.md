<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.struct.keyusage.field-encipheronly" parent="stdx.crypto.x509.struct.keyusage" -->
# KeyUsage.EncipherOnly

[← KeyUsage](index.md)

## 签名

```cangjie role=signature
public static let EncipherOnly: UInt16 = 0x0001
```

表示证书中的公钥在密钥协商过程中，仅仅用于加密计算，配合 key Agreement 使用才有意义。

## 契约

类型：UInt16
