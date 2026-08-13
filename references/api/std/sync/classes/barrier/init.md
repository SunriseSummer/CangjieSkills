<!-- cj-doc kind="api-member" level="6" id="std.sync.class.barrier.init" parent="std.sync.class.barrier" -->
# Barrier.init

[← Barrier](index.md)

## 签名

```cangjie role=signature
public init(count: Int64)
```

创建 Barrier 对象。

## 契约

参数：

- count: Int64 - 表示需要协调的线程数。

异常：

- IllegalArgumentException - 参数 count 为负数。
