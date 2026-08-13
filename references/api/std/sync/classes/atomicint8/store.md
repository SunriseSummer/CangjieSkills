<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicint8.store" parent="std.sync.class.atomicint8" -->
# AtomicInt8.store

[← AtomicInt8](index.md)

## 签名

```cangjie role=signature
public func store(val: Int8): Unit
```

写入操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型。

## 契约

参数：

- val: Int8 - 写入原子类型的值。
