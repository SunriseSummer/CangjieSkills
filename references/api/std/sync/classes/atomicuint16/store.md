<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicuint16.store" parent="std.sync.class.atomicuint16" -->
# AtomicUInt16.store

[← AtomicUInt16](index.md)

## 签名

```cangjie role=signature
public func store(val: UInt16): Unit
```

写入操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型。

## 契约

参数：

- val: UInt16 - 写入原子类型的值。
