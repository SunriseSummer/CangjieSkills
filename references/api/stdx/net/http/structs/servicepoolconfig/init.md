<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.struct.servicepoolconfig.init" parent="stdx.net.http.struct.servicepoolconfig" -->
# ServicePoolConfig.init

[← ServicePoolConfig](index.md)

## 签名

```cangjie role=signature
public init(
    capacity!: Int64 = 10 ** 4,
    queueCapacity!: Int64 = 10 ** 4,
    preheat!: Int64 = 0
)
```

构造一个 ServicePoolConfig 实例。

## 契约

参数：

- capacity!: Int64 - 协程池容量，默认值为 10000。
- queueCapacity!: Int64 - 缓冲区等待任务的最大数量，默认值为 10000。
- preheat!: Int64 - 服务启动时预先启动的协程数量，默认值为 0。

异常：

- IllegalArgumentException - 当参数 capacity/queueCapacity/preheat 小于 0，或参数 preheat 大于 capacity。
