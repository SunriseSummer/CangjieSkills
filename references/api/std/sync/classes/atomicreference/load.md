<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicreference.load" parent="std.sync.class.atomicreference" -->
# AtomicReference<T> where T <: Object.load

[← AtomicReference<T> where T <: Object](index.md)

## 签名

```cangjie role=signature
public func load(): T
```

读取操作，采用默认内存排序方式，读取原子类型的值。

## 契约

返回值：

- T - 当前原子类型的值。
