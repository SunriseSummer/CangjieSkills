<!-- cj-doc kind="api-member" level="6" id="std.unittest.struct.generateeachinputprovider.get" parent="std.unittest.struct.generateeachinputprovider" -->
# GenerateEachInputProvider<T>.get

[← GenerateEachInputProvider<T>](index.md)

## 签名

```cangjie role=signature
public mut func get(idx: Int64): T
```

获取元素，该函数的执行时间包含在基准测量中，然后作为框架开销计算的一部分从结果中排除。

## 契约

参数：

- idx: Int64 - 元素索引值。

返回值：

- T - 元素值。
