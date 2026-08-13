<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicreference.store" parent="std.sync.class.atomicreference" -->
# AtomicReference<T> where T <: Object.store

[← AtomicReference<T> where T <: Object](index.md)

## 签名

```cangjie role=signature
public func store(val: T): Unit
```

写入操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型。

## 契约

参数：

- val: T - 写入原子类型的值。
