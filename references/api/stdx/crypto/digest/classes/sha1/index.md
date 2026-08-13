<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.digest.class.sha1" parent="stdx.crypto.digest" -->
# SHA1

[← stdx.crypto.digest](../../index.md)

`SHA1 <: Digest`

提供 SHA1 算法的实现接口。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`algorithm: String`](prop-algorithm.md) | SHA1 摘要算法的算法名称。 |
| [`blockSize: Int64`](prop-blocksize.md) | SHA1 信息块长度，单位字节。 |
| [`size: Int64`](prop-size.md) | SHA1 摘要信息长度，单位字节。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 无参构造函数，创建 SHA1 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`finish(): Array<Byte>`](finish.md) | 返回生成的 SHA1 值，注意调用 finish 后 SHA1 上下文会发生改变，finish 后不可以再进行摘要计算，如重新计算需要 reset 重置上下文。 |
| [`finish(to!: Array<Byte>): Unit`](finish.md) | 获取生成的信息摘要值，注意调用 finish 后不可以再进行摘要计算，如重新计算需要 reset 重置上下文。 |
| [`reset(): Unit`](reset.md) | 重置 SHA1 对象到初始状态，清理 SHA1 上下文。 |
| [`write(buffer: Array<Byte>): Unit`](write.md) | 使用给定的 buffer 更新 SHA1 对象，在调用 finish 前可以多次更新。 |
