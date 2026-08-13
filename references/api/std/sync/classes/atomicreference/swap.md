<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicreference.swap" parent="std.sync.class.atomicreference" -->
# AtomicReference<T> where T <: Object.swap

[← AtomicReference<T> where T <: Object](index.md)

## 签名

```cangjie role=signature
public func swap(val: T): T
```

交换操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型，并返回写入前的值。

## 契约

参数：

- val: T - 写入原子类型的值。

返回值：

- T - 写入前的值。
