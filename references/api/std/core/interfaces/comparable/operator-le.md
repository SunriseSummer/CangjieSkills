<!-- cj-doc kind="api-member" level="6" id="std.core.interface.comparable.operator-le" parent="std.core.interface.comparable" -->
# Comparable<T>.<=

[← Comparable<T>](index.md)

## 签名

```cangjie role=signature
operator func <=(rhs: T): Bool
```

判断当前 `T` 类型实例是否小于等于参数指向的 `T` 类型实例，该函数是此接口的一个默认实现函数。

## 契约

参数：

- rhs: T - 待与当前实例比较的另一个实例。

返回值：

- Bool - 如果小于等于，返回 true，否则返回 false。
