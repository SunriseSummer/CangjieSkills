<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicint64.compareandswap" parent="std.sync.class.atomicint64" -->
# AtomicInt64.compareAndSwap

[← AtomicInt64](index.md)

## 签名

```cangjie role=signature
public func compareAndSwap(old: Int64, new: Int64): Bool
```

CAS 操作，采用默认内存排序方式。

## 契约

比较当前原子类型的值与参数 `old` 指定的值是否相等。若相等，则写入参数 `new` 指定的值，并返回 `true`；否则，不写入值，并返回 `false`。

参数：

- old: Int64 - 与当前原子类型进行比较的值。
- new: Int64 - 比较结果相等时，写入原子类型的值。

返回值：

- Bool - 比较后交换成功返回 `true`，否则返回 `false`。
