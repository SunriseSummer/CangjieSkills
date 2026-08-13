<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.struct.keyusage.field-nonrepudiation" parent="stdx.crypto.x509.struct.keyusage" -->
# KeyUsage.NonRepudiation

[← KeyUsage](index.md)

## 签名

```cangjie role=signature
public static let NonRepudiation: UInt16 = 0x0040
```

表示私钥可以用于进行非否认性服务中的签名，而公钥用来验证签名。

## 契约

类型：UInt16
