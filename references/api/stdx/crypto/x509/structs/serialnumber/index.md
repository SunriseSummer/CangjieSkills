<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.x509.struct.serialnumber" parent="stdx.crypto.x509" -->
# SerialNumber

[← stdx.crypto.x509](../../index.md)

`SerialNumber <: Equatable<SerialNumber> & Hashable & ToString`

结构体 SerialNumber 为数字证书的序列号，是数字证书中的一个唯一标识符，用于标识数字证书的唯一性。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(length!: UInt8 = 16)`](init.md) | 生成指定长度的随机序列号。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`override hashCode(): Int64`](hashcode.md) | 返回证书序列号哈希值。 |
| [`override toString(): String`](tostring.md) | 生成证书序列号字符串，格式为 16 进制。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator !=(other: SerialNumber): Bool`](operator-ne.md) | 判不等。 |
| [`override operator ==(other: SerialNumber): Bool`](operator-eq.md) | 判等。 |
