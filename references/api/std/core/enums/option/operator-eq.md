<!-- cj-doc kind="api-member" level="7" id="std.core.enum.option.operator-eq" parent="std.core.enum.option.extension.extend-t-option-t-equatable-option-t-where-t-equatable-t" -->
# Option<T>.==

[← extend<T> Option<T> <: Equatable<Option<T>> where T <: Equatable<T>](extensions/extend-t-option-t-equatable-option-t-where-t-equatable-t.md)

## 签名

```cangjie role=signature
public operator func ==(that: Option<T>): Bool
```

判断当前实例与参数指向的 Option<T> 实例是否相等。

## 契约

如果两者同为 None，则相等；如果两者为 Some(v1) 和 Some(v2)，且 v1 和 v2 相等，则相等。

参数：

- that: Option\<T> - 待比较的 Option\<T> 实例。

返回值：

- Bool - 如果相等，则返回 true，否则返回 false。
