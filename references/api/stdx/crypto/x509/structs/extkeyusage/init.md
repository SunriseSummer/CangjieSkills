<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.struct.extkeyusage.init" parent="stdx.crypto.x509.struct.extkeyusage" -->
# ExtKeyUsage.init

[← ExtKeyUsage](index.md)

## 签名

```cangjie role=signature
public init(keys: Array<UInt16>)
```

构造指定用途的扩展密钥用法，需要注意同一个密钥可以有多种用途。

## 契约

参数：

- keys: Array\<UInt16> - 密钥。
