<!-- cj-doc kind="api-type" level="5" id="std.crypto.digest.interface.digest" parent="std.crypto.digest" -->
# Digest

[← std.crypto.digest](../../index.md)

`Digest`

摘要算法接口，继承该接口的 class、interface、struct 也需要遵守该接口中函数的入参及返回值定义。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`algorithm: String`](prop-algorithm.md) | 获取摘要算法的算法名称。 |
| [`blockSize: Int64`](prop-blocksize.md) | 返回 Block 块长度，单位字节。 |
| [`size: Int64`](prop-size.md) | 返回生成的摘要信息长度，单位字节。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`finish(): Array<Byte>`](finish.md) | 返回生成的 digest 值。 |
| [`finish(to!: Array<Byte>): Unit`](finish.md) | 获取生成的信息摘要值，注意调用 finish 后不可以再进行摘要计算，如重新计算需要 reset 重置上下文。 |
| [`reset(): Unit`](reset.md) | 重置 digest 对象到初始状态。 |
| [`write(buffer: Array<Byte>): Unit`](write.md) | 使用给定的 buffer 更新 digest 对象。 |
