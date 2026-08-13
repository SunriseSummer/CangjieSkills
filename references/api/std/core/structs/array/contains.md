<!-- cj-doc kind="api-member" level="7" id="std.core.struct.array.contains" parent="std.core.struct.array.extension.extend-t-array-t-equatable-array-t-where-t-equatable-t" -->
# Array<T>.contains

[← extend<T> Array<T> <: Equatable<Array<T>> where T <: Equatable<T>](extensions/extend-t-array-t-equatable-array-t-where-t-equatable-t.md)

## 签名

```cangjie role=signature
public func contains(element: T): Bool
```

查找当前数组是否包含指定元素。

## 契约

参数：

- element: T - 需要查找的目标元素。

返回值：

- Bool - 如果存在，则返回 true，否则返回 false。
