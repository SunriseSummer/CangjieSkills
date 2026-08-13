<!-- cj-doc kind="api-member" level="6" id="std.core.enum.option.getordefault" parent="std.core.enum.option" -->
# Option<T>.getOrDefault

[← Option<T>](index.md)

## 签名

```cangjie role=signature
public func getOrDefault(other: () -> T): T
```

获得值或返回默认值。

## 契约

功能：获得值或返回默认值。如果 Option 值是 Some，则返回类型为 `T` 的实例，如果 Option 值是 None，则调用入参，返回类型 `T` 的值。

参数：

- other: () -> T - 默认函数，如果当前实例的值是 None，调用该函数得到类型为 `T` 的实例，并将其返回。

返回值：

- T - 如果当前实例的值是 Some\<T>，则返回当前实例携带的类型为 `T` 的实例，如果 Option 值是 None，调用入参指定的函数，得到类型为 `T` 的实例，并将其返回。
