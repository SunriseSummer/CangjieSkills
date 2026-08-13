<!-- cj-doc kind="api-type" level="5" id="stdx.net.http.struct.servicepoolconfig" parent="stdx.net.http" -->
# ServicePoolConfig

[← stdx.net.http](../../index.md)

`ServicePoolConfig`

Http Server 协程池配置。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`capacity: Int64`](field-capacity.md) | 获取协程池容量。 |
| [`preheat: Int64`](field-preheat.md) | 获取服务启动时预先启动的协程数量。 |
| [`queueCapacity: Int64`](field-queuecapacity.md) | 获取缓冲区等待任务的最大数量。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init( capacity!: Int64 = 10 ** 4, queueCapacity!: Int64 = 10 ** 4, preheat!: Int64 = 0 )`](init.md) | 构造一个 ServicePoolConfig 实例。 |
