<!-- cj-doc kind="api-member" level="5" id="std.runtime.func.gc-bool" parent="std.runtime" -->
# gc(Bool)

[← std.runtime](../index.md)

## 签名

```cangjie role=signature
public func gc(heavy!: Bool = false): Unit
```

执行 gc。

## 契约

参数：

- heavy!: Bool - gc 执行程度，如果为 true，执行会慢，内存收集的多一些，默认值为 false。
