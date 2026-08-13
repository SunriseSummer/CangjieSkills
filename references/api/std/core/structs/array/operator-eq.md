<!-- cj-doc kind="api-member" level="7" id="std.core.struct.array.operator-eq" parent="std.core.struct.array.extension.extend-t-array-t-equatable-array-t-where-t-equatable-t" -->
# Array<T>.==

[← extend<T> Array<T> <: Equatable<Array<T>> where T <: Equatable<T>](extensions/extend-t-array-t-equatable-array-t-where-t-equatable-t.md)

## 签名

```cangjie role=signature
public operator const func ==(that: Array<T>): Bool
```

判断当前实例与指定 Array<T> 实例是否相等。

## 契约

两个 Array\<T> 相等指的是其中的每个元素都相等。

参数：

- that: Array\<T> - 用于与当前实例比较的另一个 Array\<T> 实例。

返回值：

- Bool - 如果相等，则返回 true，否则返回 false。
