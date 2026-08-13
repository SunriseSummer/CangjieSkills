<!-- cj-doc kind="api-member" level="7" id="std.core.struct.array.removeprefix" parent="std.core.struct.array.extension.extend-t-array-t-equatable-array-t-where-t-equatable-t" -->
# Array<T>.removePrefix

[← extend<T> Array<T> <: Equatable<Array<T>> where T <: Equatable<T>](extensions/extend-t-array-t-equatable-array-t-where-t-equatable-t.md)

## 签名

```cangjie role=signature
public func removePrefix(prefix: Array<T>): Array<T>
```

删除前缀。

## 契约

如果当前数组开头与 prefix 完全匹配，删除其前缀。返回值为当前数组删除前缀后得到的切片。

参数：

- prefix: Array\<T> - 待删除的前缀。

返回值：

- Array\<T> - 删除前缀后得到的原数组切片。
