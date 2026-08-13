<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.digest.class.md5" parent="stdx.crypto.digest" -->
# MD5

[← stdx.crypto.digest](../../index.md)

`MD5 <: Digest`

提供 MD5 算法的实现接口。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`algorithm: String`](prop-algorithm.md) | MD5 摘要算法的算法名称。 |
| [`blockSize: Int64`](prop-blocksize.md) | MD5 信息块长度，单位字节。 |
| [`size: Int64`](prop-size.md) | MD5 摘要信息长度，单位字节。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 无参构造函数，创建 MD5 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`finish(): Array<Byte>`](finish.md) | 返回生成的 MD5 值，注意调用 finish 后 MD5 上下文会发生改变，finish 后不可以再进行摘要计算，如重新计算需要 reset 重置上下文。 |
| [`finish(to!: Array<Byte>): Unit`](finish.md) | 获取生成的信息摘要值，注意调用 finish 后不可以再进行摘要计算，如重新计算需要 reset 重置上下文。 |
| [`reset(): Unit`](reset.md) | 重置 MD5 对象到初始状态，清理 MD5 上下文。 |
| [`write(buffer: Array<Byte>): Unit`](write.md) | 使用给定的 buffer 更新 MD5 对象，在调用 finish 前可以多次更新。 |
