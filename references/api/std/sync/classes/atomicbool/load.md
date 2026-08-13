<!-- cj-doc kind="api-member" level="6" id="std.sync.class.atomicbool.load" parent="std.sync.class.atomicbool" -->
# AtomicBool.load

[← AtomicBool](index.md)

## 签名

```cangjie role=signature
public func load(): Bool
```

读取操作，采用默认内存排序方式，读取原子类型的值。

## 契约

返回值：

- Bool - 当前原子类型的值。
