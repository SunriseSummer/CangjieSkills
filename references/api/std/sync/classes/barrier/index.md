<!-- cj-doc kind="api-type" level="5" id="std.sync.class.barrier" parent="std.sync" -->
# Barrier

[← std.sync](../../index.md)

`Barrier`

提供协调多个线程一起执行到某一个程序点的功能。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(count: Int64)`](init.md) | 创建 Barrier 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`wait(timeout!: Duration = Duration.Max): Unit`](wait.md) | 线程进入 Barrier 等待点。 |
