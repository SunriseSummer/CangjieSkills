<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicint64.load" parent="std.sync.class.atomicint64" -->
# AtomicInt64.load

[← AtomicInt64](index.md)

## 签名

```cangjie role=signature
public func load(): Int64
```

读取操作，采用默认内存排序方式，读取原子类型的值。

## 契约

返回值：

- Int64 - 当前原子类型的值。
