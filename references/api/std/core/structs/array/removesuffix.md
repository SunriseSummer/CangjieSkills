<!-- cj-doc kind="api-member" level="7" id="std.core.struct.array.removesuffix" parent="std.core.struct.array.extension.extend-t-array-t-equatable-array-t-where-t-equatable-t" -->
# Array<T>.removeSuffix

[← extend<T> Array<T> <: Equatable<Array<T>> where T <: Equatable<T>](extensions/extend-t-array-t-equatable-array-t-where-t-equatable-t.md)

## 签名

```cangjie role=signature
public func removeSuffix(suffix: Array<T>): Array<T>
```

删除后缀。

## 契约

如果当前数组结尾与 suffix 完全匹配，删除其后缀。返回值为当前数组删除后缀后得到的切片。

参数：

- suffix: Array\<T> - 待删除的后缀。

返回值：

- Array\<T> - 删除后缀后得到的原数组切片。
