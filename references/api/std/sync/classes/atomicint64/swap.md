<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicint64.swap" parent="std.sync.class.atomicint64" -->
# AtomicInt64.swap

[← AtomicInt64](index.md)

## 签名

```cangjie role=signature
public func swap(val: Int64): Int64
```

交换操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型，并返回写入前的值。

## 契约

参数：

- val: Int64 - 写入原子类型的值。

返回值：

- Int64 - 写入前的值。
