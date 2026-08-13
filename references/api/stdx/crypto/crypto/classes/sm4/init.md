<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.crypto.class.sm4.init" parent="stdx.crypto.crypto.class.sm4" -->
# SM4.init

[← SM4](index.md)

## 签名

```cangjie role=signature
public init(
    optMode: OperationMode,
    key: Array<Byte>,
    iv!: Array<Byte> = Array<Byte>(),
    paddingMode!: PaddingMode = PaddingMode.PKCS7Padding,
    aad!: Array<Byte> = Array<Byte>(),
    tagSize!: Int64 = 16
)
```

创建 SM4 实例，可指定在不同工作模式下参数。

## 契约

参数：

- optMode: OperationMode - 设置加解密工作模式。
- key: Array\<Byte> - 密钥，长度为 16 字节。
- iv!: Array\<Byte> - 初始化向量。
- paddingMode!: PaddingMode - 设置填充模式。
- aad!: Array\<Byte> - 设置附加数据。
- tagSize!: Int64 - 设置摘要长度。

异常：

- CryptoException - 参数设置不正确，实例化失败。
