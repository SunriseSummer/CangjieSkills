<!-- cj-doc kind="api-member" level="7" id="std.core.struct.array.operator-ne" parent="std.core.struct.array.extension.extend-t-array-t-equatable-array-t-where-t-equatable-t" -->
# Array<T>.!=

[← extend<T> Array<T> <: Equatable<Array<T>> where T <: Equatable<T>](extensions/extend-t-array-t-equatable-array-t-where-t-equatable-t.md)

## 签名

```cangjie role=signature
public operator const func !=(that: Array<T>): Bool
```

判断当前实例与指定 Array<T> 实例是否不等。

## 契约

参数：

- that: Array\<T> - 用于与当前实例比较的另一个 Array\<T> 实例。

返回值：

- Bool - 如果不相等，则返回 true；相等则返回 false。
