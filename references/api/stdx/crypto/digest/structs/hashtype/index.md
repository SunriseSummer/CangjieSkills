<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.digest.struct.hashtype" parent="stdx.crypto.digest" -->
# HashType

[← stdx.crypto.digest](../../index.md)

`HashType <: ToString & Equatable<HashType>`

此类为 Hash 算法类别结构体，MD5、SHA1、SHA224、SHA256、SHA384、SHA512 均为常用摘要算法。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`static MD5: HashType`](prop-md5.md) | 返回 MD5 类型。 |
| [`static SHA1: HashType`](prop-sha1.md) | 返回 SHA1 类型。 |
| [`static SHA224: HashType`](prop-sha224.md) | 返回 SHA224 类型。 |
| [`static SHA256: HashType`](prop-sha256.md) | 返回 SHA256 类型。 |
| [`static SHA384: HashType`](prop-sha384.md) | 返回 SHA384 类型。 |
| [`static SHA512: HashType`](prop-sha512.md) | 返回 SHA512 类型。 |
| [`static SM3: HashType`](prop-sm3.md) | 返回 SM3 类型。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toString(): String`](tostring.md) | 获取 Hash 算法名称。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`override operator ==(other: HashType): Bool`](operator-eq.md) | 判断两 HashType 是否引用同一实例。 |
| [`override operator !=(other: HashType): Bool`](operator-ne.md) | 判断两 HashType 是否引用不同实例。 |
