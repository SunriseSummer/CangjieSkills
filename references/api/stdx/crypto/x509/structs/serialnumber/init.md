<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.x509.struct.serialnumber.init" parent="stdx.crypto.x509.struct.serialnumber" -->
# SerialNumber.init

[← SerialNumber](index.md)

## 签名

```cangjie role=signature
public init(length!: UInt8 = 16)
```

生成指定长度的随机序列号。

## 契约

参数：

- length!: UInt8 - 序列号长度，单位为字节，类型为 UInt8，默认值为 16。

异常：

- X509Exception - length 等于 0 或大于 20 时，抛出异常。
