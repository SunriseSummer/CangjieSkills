<!-- cj-doc kind="api-member" level="6" id="std.core.interface.comparable.compare" parent="std.core.interface.comparable" -->
# Comparable<T>.compare

[← Comparable<T>](index.md)

## 签名

```cangjie role=signature
func compare(that: T): Ordering
```

判断当前 `T` 类型实例与参数指向的 `T` 类型实例的大小关系。

## 契约

参数：

- that: T - 待与当前实例比较的另一个实例。

返回值：

- Ordering - 如果大于，返回 Ordering.GT，如果等于，返回 Ordering.EQ，如果小于，返回 Ordering.LT。
