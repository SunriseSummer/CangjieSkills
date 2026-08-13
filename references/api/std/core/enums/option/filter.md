<!-- cj-doc kind="api-member" level="6" id="std.core.enum.option.filter" parent="std.core.enum.option" -->
# Option<T>.filter

[← Option<T>](index.md)

## 签名

```cangjie role=signature
public func filter(predicate: (T) -> Bool): Option<T>
```

提供 Option 类型的“过滤”功能。

## 契约

参数：

- predicate: (T) -> Bool - 过滤函数。

返回值：

- Option\<T> - 如果 Option 值是 Some(v)，并且 v 满足 `predicate(v) = true` 时，返回 Some(v)， 否则返回 None。
