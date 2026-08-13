<!-- cj-doc kind="api-type" level="5" id="stdx.crypto.digest.class.hmac" parent="stdx.crypto.digest" -->
# HMAC

[← stdx.crypto.digest](../../index.md)

`HMAC <: Digest`

提供 HMAC 算法的实现。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`algorithm: String`](prop-algorithm.md) | HMAC 所选 Hash 算法的算法名称。 |
| [`blockSize: Int64`](prop-blocksize.md) | HMAC 所选 Hash 算法信息块长度，单位字节。 |
| [`size: Int64`](prop-size.md) | HMAC 所选 Hash 算法的摘要信息长度，单位字节。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(key: Array<Byte>, digest: () -> Digest)`](init.md) | 构造函数，创建 HMAC 对象。 |
| [`init(key: Array<Byte>, algorithm: HashType)`](init.md) | 构造函数，创建 HMAC 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`static equal(mac1: Array<Byte>, mac2: Array<Byte>): Bool`](equal.md) | 比较两个信息摘要是否相等，且不泄露比较时间，即比较不采用传统短路原则，从而防止 timing attack 类型的攻击。 |
| [`finish(): Array<Byte>`](finish.md) | 返回生成的信息摘要值，注意调用 finish 后不可以再进行摘要计算，如重新计算需要 reset 重置上下文。 |
| [`finish(to!: Array<Byte>): Unit`](finish.md) | 获取生成的信息摘要值，注意调用 finish 后不可以再进行摘要计算，如重新计算需要 reset 重置上下文。 |
| [`reset(): Unit`](reset.md) | 重置 HMAC 对象到初始状态，清理 HMAC 上下文。 |
| [`write(buffer: Array<Byte>): Unit`](write.md) | 使用给定的 buffer 更新 HMAC 对象，在调用 finish 前可以多次更新。 |
