<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.struct.keyusage.field-certsign" parent="stdx.crypto.x509.struct.keyusage" -->
# KeyUsage.CertSign

[← KeyUsage](index.md)

## 签名

```cangjie role=signature
public static let CertSign: UInt16 = 0x0004
```

表示私钥用于证书签名，而公钥用于验证证书签名，专用于 CA 证书。

## 契约

类型：UInt16
