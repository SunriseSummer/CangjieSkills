<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.struct.keyusage.field-decipheronly" parent="stdx.crypto.x509.struct.keyusage" -->
# KeyUsage.DecipherOnly

[← KeyUsage](index.md)

## 签名

```cangjie role=signature
public static let DecipherOnly: UInt16 = 0x0100
```

表示证书中的公钥在密钥协商过程中，仅仅用于解密计算，配合 key Agreement 使用才有意义。

## 契约

类型：UInt16
