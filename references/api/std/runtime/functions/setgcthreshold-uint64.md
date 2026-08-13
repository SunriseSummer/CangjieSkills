<!-- cj-doc kind="api-member" level="5" id="std.runtime.func.setgcthreshold-uint64" parent="std.runtime" -->
# setGCThreshold(UInt64)

[← std.runtime](../index.md)

## 签名

```cangjie role=signature
public func setGCThreshold(value: UInt64): Unit
```

修改用户期望触发 gc 的内存阈值，当仓颉堆大小超过该值时，触发 gc，单位为 KB。

## 契约

参数：

- value: UInt64 - 用户期望触发 gc 的内存阈值。
