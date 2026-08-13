<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.crypto.struct.paddingmode" parent="stdx.crypto.crypto" -->
# PaddingMode

[← stdx.crypto.crypto](../../index.md)

`PaddingMode <: Equatable<PaddingMode>`

对称加解密算法的填充模式。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`NoPadding: PaddingMode`](field-nopadding.md) | 不填充，NoPadding 初始值是 PaddingMode(0)。 |
| [`PKCS7Padding: PaddingMode`](field-pkcs7padding.md) | 采用 PKCS7 协议填充，PKCS7Padding 初始值是 PaddingMode(1)。 |
| [`paddingType: Int64`](field-paddingtype.md) | 分组加解密填充方式，目前支持非填充和 pkcs7 填充。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator ==(other: PaddingMode): Bool`](operator-eq.md) | 填充模式比较是否相同。 |
| [`override operator !=(other: PaddingMode): Bool`](operator-ne.md) | 工作模式比较是否不相同。 |
