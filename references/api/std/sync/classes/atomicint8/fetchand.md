<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicint8.fetchand" parent="std.sync.class.atomicint8" -->
# AtomicInt8.fetchAnd

[← AtomicInt8](index.md)

## 签名

```cangjie role=signature
public func fetchAnd(val: Int8): Int8
```

采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行与操作。

## 契约

功能：采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行与操作。将结果写入当前原子类型实例，并返回与操作前的值。

参数：

- val: Int8 - 与原子类型进行与操作的值。

返回值：

- Int8 - 执行与操作前的值。
