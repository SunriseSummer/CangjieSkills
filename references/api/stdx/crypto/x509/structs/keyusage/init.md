<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.struct.keyusage.init" parent="stdx.crypto.x509.struct.keyusage" -->
# KeyUsage.init

[← KeyUsage](index.md)

## 签名

```cangjie role=signature
public init(keys: UInt16)
```

构造指定用途的扩展密钥用法，需要注意同一个密钥可以有多种用途。

## 契约

参数：

- keys: UInt16 - 密钥的用法，建议使用本结构中所提供的密钥用法变量通过按位或的方式传入参数。
