<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicuint64.fetchor" parent="std.sync.class.atomicuint64" -->
# AtomicUInt64.fetchOr

[← AtomicUInt64](index.md)

## 签名

```cangjie role=signature
public func fetchOr(val: UInt64): UInt64
```

采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行或操作。

## 契约

功能：采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行或操作。将结果写入当前原子类型实例，并返回或操作前的值。

参数：

- val: UInt64 - 与原子类型进行或操作的值。

返回值：

- UInt64 - 执行或操作前的值。
