<!-- cj-doc kind="api-member" level="7" id="std.core.intrinsic.float16.isinf" parent="std.core.intrinsic.float16.extension.extend-float16" -->
# Float16.isInf

[← extend Float16](extensions/extend-float16.md)

## 签名

```cangjie role=signature
public func isInf(): Bool
```

判断某个浮点数 Float16 是否为无穷数值。

## 契约

返回值：

- Bool - 如果 Float16 的值正无穷大或负无穷大，则返回 `true`；否则，返回 `false`。
