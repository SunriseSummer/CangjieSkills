<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicint16.fetchsub" parent="std.sync.class.atomicint16" -->
# AtomicInt16.fetchSub

[← AtomicInt16](index.md)

## 签名

```cangjie role=signature
public func fetchSub(val: Int16): Int16
```

采用默认内存排序方式，以原子类型的值为被减数，参数 `val` 为减数，做减操作。

## 契约

功能：采用默认内存排序方式，以原子类型的值为被减数，参数 `val` 为减数，做减操作。将结果写入当前原子类型实例，并返回减操作前的值。

参数：

- val: Int16 - 与原子类型进行减操作的值。

返回值：

- Int16 - 执行减操作前的值。
