<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.struct.keyusage.field-digitalsignature" parent="stdx.crypto.x509.struct.keyusage" -->
# KeyUsage.DigitalSignature

[← KeyUsage](index.md)

## 签名

```cangjie role=signature
public static let DigitalSignature: UInt16 = 0x0080
```

表示私钥可以用于除了签发证书、签发 CRL 和非否认性服务的各种数字签名操作，而公钥用来验证这些签名。

## 契约

类型：UInt16
