<!-- cj-doc kind="api-type" level="5" id="std.crypto.cipher.interface.blockcipher" parent="std.crypto.cipher" -->
# BlockCipher

[← std.crypto.cipher](../../index.md)

`BlockCipher`

分组加解密算法接口，继承该接口的 class、interface、struct 也需要遵守该接口中函数的入参及返回值定义。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`algorithm: String`](prop-algorithm.md) | 获取分组加解密算法的算法名称。 |
| [`blockSize: Int64`](prop-blocksize.md) | 分组块长度，单位字节。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`decrypt(input: Array<Byte>): Array<Byte>`](decrypt.md) | 提供解密函数。 |
| [`decrypt(input: Array<Byte>, to!: Array<Byte>): Int64`](decrypt.md) | 提供解密函数。 |
| [`encrypt(input: Array<Byte>): Array<Byte>`](encrypt.md) | 提供加密函数。 |
| [`encrypt(input: Array<Byte>, to!: Array<Byte>): Int64`](encrypt.md) | 提供加密函数。 |
