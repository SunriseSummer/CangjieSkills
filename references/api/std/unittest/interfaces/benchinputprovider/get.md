<!-- cj-doc kind="api-member" level="6" id="std.unittest.interface.benchinputprovider.get" parent="std.unittest.interface.benchinputprovider" -->
# BenchInputProvider.get

[← BenchInputProvider](index.md)

## 签名

```cangjie role=signature
mut func get(idx: Int64): T
```

获取元素。

## 契约

功能：获取元素。该函数的执行时间包含在基准测量中，然后作为框架开销计算的一部分从结果中排除。

参数：

- idx: Int64 - 元素索引值。

返回值：

- T - 元素值。
