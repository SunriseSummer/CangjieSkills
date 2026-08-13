<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicuint8.fetchadd" parent="std.sync.class.atomicuint8" -->
# AtomicUInt8.fetchAdd

[← AtomicUInt8](index.md)

## 签名

```cangjie role=signature
public func fetchAdd(val: UInt8): UInt8
```

采用默认内存排序方式，将原子类型的值与参数 `val` 进行加操作，将结果写入当前原子类型实例，并返回加操作前的值。

## 契约

参数：

- val: UInt8 - 与原子类型进行加操作的值。

返回值：

- UInt8 - 执行加操作前的值。
