<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicoptionreference.load" parent="std.sync.class.atomicoptionreference" -->
# AtomicOptionReference<T> where T <: Object.load

[← AtomicOptionReference<T> where T <: Object](index.md)

## 签名

```cangjie role=signature
public func load(): Option<T>
```

读取操作，采用默认内存排序方式，读取原子类型的值。

## 契约

返回值：

- Option\<T> - 当前原子类型的值。
