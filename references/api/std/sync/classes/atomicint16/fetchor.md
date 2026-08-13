<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicint16.fetchor" parent="std.sync.class.atomicint16" -->
# AtomicInt16.fetchOr

[← AtomicInt16](index.md)

## 签名

```cangjie role=signature
public func fetchOr(val: Int16): Int16
```

采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行或操作。

## 契约

功能：采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行或操作。将结果写入当前原子类型实例，并返回或操作前的值。

参数：

- val: Int16 - 与原子类型进行或操作的值。

返回值：

- Int16 - 执行或操作前的值。
