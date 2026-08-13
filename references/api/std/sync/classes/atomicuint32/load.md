<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicuint32.load" parent="std.sync.class.atomicuint32" -->
# AtomicUInt32.load

[← AtomicUInt32](index.md)

## 签名

```cangjie role=signature
public func load(): UInt32
```

读取操作，采用默认内存排序方式，读取原子类型的值。

## 契约

返回值：

- UInt32 - 当前原子类型的值。
