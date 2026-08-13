<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicuint8.fetchsub" parent="std.sync.class.atomicuint8" -->
# AtomicUInt8.fetchSub

[← AtomicUInt8](index.md)

## 签名

```cangjie role=signature
public func fetchSub(val: UInt8): UInt8
```

采用默认内存排序方式，以原子类型的值为被减数，参数 `val` 为减数，做减操作。

## 契约

功能：采用默认内存排序方式，以原子类型的值为被减数，参数 `val` 为减数，做减操作。将结果写入当前原子类型实例，并返回减操作前的值。

参数：

- val: UInt8 - 与原子类型进行减操作的值。

返回值：

- UInt8 - 执行减操作前的值。
