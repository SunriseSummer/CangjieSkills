<!-- cj-doc kind="api-type" level="5" id="std.sync.class.synccounter" parent="std.sync" -->
# SyncCounter

[← std.sync](../../index.md)

`SyncCounter`

提供倒数计数器功能。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`count: Int64`](prop-count.md) | 获取计数器的当前值。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(count: Int64)`](init.md) | 创建倒数计数器。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`dec(): Unit`](dec.md) | 计数器减一。 |
| [`waitUntilZero(timeout!: Duration = Duration.Max): Unit`](waituntilzero.md) | 当前线程等待直到计数器变为零，或等待时间超过 `timeout`。 |
