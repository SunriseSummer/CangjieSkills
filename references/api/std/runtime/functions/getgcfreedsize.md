<!-- cj-doc kind="api-member" level="5" id="std.runtime.func.getgcfreedsize" parent="std.runtime" -->
# getGCFreedSize()

[← std.runtime](../index.md)

## 签名

```cangjie role=signature
public func getGCFreedSize(): Int64
```

获取触发 GC 后，成功回收的内存，单位为 byte。

## 契约

返回值：

- Int64 - 触发 GC 后，成功回收的内存，单位为 byte。
