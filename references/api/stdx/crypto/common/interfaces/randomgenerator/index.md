<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.common.interface.randomgenerator" parent="stdx.crypto.common" -->
# RandomGenerator

[← stdx.crypto.common](../../index.md)

`interface RandomGenerator`

安全随机数生成器接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`func nextBits(bits: UInt64): UInt64`](nextbits.md) | 生成一个指定位长的随机整数。 |
| [`func nextBytes(bytes: Array<Byte>): Unit`](nextbytes.md) | 生成随机数替换入参数组中的每个元素。 |

