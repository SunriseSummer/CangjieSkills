<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicoptionreference.store" parent="std.sync.class.atomicoptionreference" -->
# AtomicOptionReference<T> where T <: Object.store

[← AtomicOptionReference<T> where T <: Object](index.md)

## 签名

```cangjie role=signature
public func store(val: Option<T>): Unit
```

写入操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型。

## 契约

参数：

- val: Option\<T> - 写入原子类型的值。
