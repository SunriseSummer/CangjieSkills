<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicint64.fetchand" parent="std.sync.class.atomicint64" -->
# AtomicInt64.fetchAnd

[← AtomicInt64](index.md)

## 签名

```cangjie role=signature
public func fetchAnd(val: Int64): Int64
```

采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行与操作。

## 契约

功能：采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行与操作。将结果写入当前原子类型实例，并返回与操作前的值。

参数：

- val: Int64 - 与原子类型进行与操作的值。

返回值：

- Int64 - 执行与操作前的值。
