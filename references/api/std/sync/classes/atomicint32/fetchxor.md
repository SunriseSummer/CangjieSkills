<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicint32.fetchxor" parent="std.sync.class.atomicint32" -->
# AtomicInt32.fetchXor

[← AtomicInt32](index.md)

## 签名

```cangjie role=signature
public func fetchXor(val: Int32): Int32
```

采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行异或操作。

## 契约

功能：采用默认内存排序方式，将当前原子类型实例的值与参数 `val` 进行异或操作。将结果写入当前原子类型实例，并返回异或操作前的值。

参数：

- val: Int32 - 与原子类型进行异或操作的值。

返回值：

- Int32 - 执行异或操作前的值。
