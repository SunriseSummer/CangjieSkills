<!-- cj-doc kind="api-member" level="6" id="stdx.net.http.class.serverbuilder.servicepoolconfig" parent="stdx.net.http.class.serverbuilder" -->
# ServerBuilder.servicePoolConfig

[← ServerBuilder](index.md)

## 签名

```cangjie role=signature
public func servicePoolConfig(cfg: ServicePoolConfig): ServerBuilder
```

服务过程中使用的协程池相关设置，具体说明见 ServicePoolConfig 结构体。

## 契约

参数：

- cfg: ServicePoolConfig - 协程池相关设置。

返回值：

- ServerBuilder - 当前 ServerBuilder 的引用。
