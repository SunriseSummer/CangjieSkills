<!-- cj-doc kind="api-member" level="6" id="std.sync.class.synccounter.init" parent="std.sync.class.synccounter" -->
# SyncCounter.init

[← SyncCounter](index.md)

## 签名

```cangjie role=signature
public init(count: Int64)
```

创建倒数计数器。

## 契约

参数：

- count: Int64 - 倒数计数器的初始值。

异常：

- IllegalArgumentException - 如果参数 count 为负数。
