<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicbool.swap" parent="std.sync.class.atomicbool" -->
# AtomicBool.swap

[← AtomicBool](index.md)

## 签名

```cangjie role=signature
public func swap(val: Bool): Bool
```

交换操作，采用默认内存排序方式，将参数 `val` 指定的值写入原子类型，并返回写入前的值。

## 契约

参数：

- val: Bool - 写入原子类型的值。

返回值：

- Bool - 写入前的值。
