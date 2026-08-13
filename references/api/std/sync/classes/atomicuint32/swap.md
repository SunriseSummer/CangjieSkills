<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicuint32.swap" parent="std.sync.class.atomicuint32" -->
# AtomicUInt32.swap

[← AtomicUInt32](index.md)

## 签名

```cangjie role=signature
public func swap(val: UInt32): UInt32
```

交换操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型，并返回写入前的值。

## 契约

参数：

- val: UInt32 - 写入原子类型的值。

返回值：

- UInt32 - 写入前的值。
