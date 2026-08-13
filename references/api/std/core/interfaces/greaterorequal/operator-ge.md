<!-- cj-doc kind="api-member" level="6" id="std.core.interface.greaterorequal.operator-ge" parent="std.core.interface.greaterorequal" -->
# GreaterOrEqual<T>.>=

[← GreaterOrEqual<T>](index.md)

## 签名

```cangjie role=signature
operator func >=(rhs: T): Bool
```

判断当前 `T` 类型实例是否大于等于参数指向的 `T` 类型实例。

## 契约

参数：

- rhs: T - 待与当前实例比较的另一个实例。

返回值：

- Bool - 如果大于等于，返回 true，否则返回 false。
