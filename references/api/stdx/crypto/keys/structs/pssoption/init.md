<!-- cj-doc kind="api-member" level="6" id="stdx.crypto.keys.struct.pssoption.init" parent="stdx.crypto.keys.struct.pssoption" -->
# PSSOption.init

[← PSSOption](index.md)

## 签名

```cangjie role=signature
public init(saltLen: Int32)
```

初始化 PSS 填充参数。

## 契约

参数：

- saltLen: Int32 - 随机盐长度，长度应大于等于 0，小于等于（RSA 长度 - 摘要长度 - 2），长度单位为字节，长度过长会导致签名失败。

异常：

- CryptoException - 随机盐长度小于 0，抛出异常。
