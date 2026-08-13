<!-- cj-doc kind="api-member" level="6" id="std.unittest.struct.generateeachinputprovider.reset" parent="std.unittest.struct.generateeachinputprovider" -->
# GenerateEachInputProvider<T>.reset

[← GenerateEachInputProvider<T>](index.md)

## 签名

```cangjie role=signature
public mut func reset(max: Int64)
```

在基准测量之前调用。

## 契约

功能：在基准测量之前调用。调用此函数后，后续的 `get(i)` 调用必须成功获取 [0, max) 中的 `i` 。

参数：

- max: Int64 - 最大值。
