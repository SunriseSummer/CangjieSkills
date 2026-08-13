<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicint32.load" parent="std.sync.class.atomicint32" -->
# AtomicInt32.load

[← AtomicInt32](index.md)

## 签名

```cangjie role=signature
public func load(): Int32
```

读取操作，采用默认内存排序方式，读取原子类型的值。

## 契约

返回值：

- Int32 - 当前原子类型的值。
