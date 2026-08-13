<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicuint32.store" parent="std.sync.class.atomicuint32" -->
# AtomicUInt32.store

[← AtomicUInt32](index.md)

## 签名

```cangjie role=signature
public func store(val: UInt32): Unit
```

写入操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型。

## 契约

参数：

- val: UInt32 - 写入原子类型的值。
