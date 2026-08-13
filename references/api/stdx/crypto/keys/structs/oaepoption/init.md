<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.struct.oaepoption.init" parent="stdx.crypto.keys.struct.oaepoption" -->
# OAEPOption.init

[← OAEPOption](index.md)

## 签名

```cangjie role=signature
public init(hash: Digest, mgfHash: Digest, label!: String = "")
```

初始化 OAEP 填充参数。

## 契约

参数：

- hash: Digest - 摘要方法，用于对 label 进行摘要。
- mgfHash: Digest - 摘要方法，用于设置 MGF1 函数中的摘要方法。
- label!: String - label 是可选参数，默认为空字符串，可以通过设置 label 来区分不同的加密操作。
