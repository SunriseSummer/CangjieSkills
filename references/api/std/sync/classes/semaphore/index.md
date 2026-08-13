<!-- cj-doc kind="api-type" level="5" id="std.sync.class.semaphore" parent="std.sync" -->
# Semaphore

[← std.sync](../../index.md)

`Semaphore`

提供信号量相关功能。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`count: Int64`](prop-count.md) | 返回当前内部计数器的值。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(count: Int64)`](init.md) | 创建一个 Semaphore 对象并初始化内部计数器的值。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`acquire(amount!: Int64 = 1): Unit`](acquire.md) | 向 Semaphore 对象获取指定值。 |
| [`release(amount!: Int64 = 1): Unit`](release.md) | 向 Semaphore 对象释放指定值。 |
| [`tryAcquire(amount!: Int64 = 1): Bool`](tryacquire.md) | 尝试向 Semaphore 对象获取指定值。 |
