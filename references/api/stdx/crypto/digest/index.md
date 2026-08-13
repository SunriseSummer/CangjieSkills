<!-- cj-doc kind="api-package" level="4" id="stdx.crypto.digest" parent="api.stdx" -->
# stdx.crypto.digest

[← stdx 包索引](../../index.md)

提供常用的消息摘要算法，包括 MD5、SHA1、SHA224、SHA256、SHA384、SHA512、HMAC、SM3 等。

包路径：`stdx.crypto.digest`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`HMAC <: Digest`](classes/hmac/index.md) | 提供 HMAC 算法的实现。 |
| [`MD5 <: Digest`](classes/md5/index.md) | 提供 MD5 算法的实现接口。 |
| [`SHA1 <: Digest`](classes/sha1/index.md) | 提供 SHA1 算法的实现接口。 |
| [`SHA224 <: Digest`](classes/sha224/index.md) | 提供 SHA224 算法的实现接口。 |
| [`SHA256 <: Digest`](classes/sha256/index.md) | 提供 SHA256 算法的实现接口。 |
| [`SHA384 <: Digest`](classes/sha384/index.md) | 提供 SHA384 算法的实现接口。 |
| [`SHA512 <: Digest`](classes/sha512/index.md) | 提供 SHA512 算法的实现接口。 |
| [`SM3 <: Digest`](classes/sm3/index.md) | 提供 SM3 算法的实现接口。 |
| [`CryptoException <: Exception`](classes/cryptoexception/index.md) | 此类为摘要和加解密出现错误时抛出的异常。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`HashType <: ToString & Equatable<HashType>`](structs/hashtype/index.md) | 此类为 Hash 算法类别结构体，MD5、SHA1、SHA224、SHA256、SHA384、SHA512 均为常用摘要算法。 |
