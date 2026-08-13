<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicint64.store" parent="std.sync.class.atomicint64" -->
# AtomicInt64.store

[← AtomicInt64](index.md)

## 签名

```cangjie role=signature
public func store(val: Int64): Unit
```

写入操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型。

## 契约

参数：

- val: Int64 - 写入原子类型的值。
