<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicint32.fetchadd" parent="std.sync.class.atomicint32" -->
# AtomicInt32.fetchAdd

[← AtomicInt32](index.md)

## 签名

```cangjie role=signature
public func fetchAdd(val: Int32): Int32
```

采用默认内存排序方式，将原子类型的值与参数 `val` 进行加操作，将结果写入当前原子类型实例，并返回加操作前的值。

## 契约

参数：

- val: Int32 - 与原子类型进行加操作的值。

返回值：

- Int32 - 执行加操作前的值。
