<!-- cj-doc kind="api-member" level="6" id="std.core.enum.option.map" parent="std.core.enum.option" -->
# Option<T>.map

[← Option<T>](index.md)

## 签名

```cangjie role=signature
public func map<R>(transform: (T)-> R): Option<R>
```

提供从 Option<T> 类型到 Option<R> 类型的映射函数，如果当前实例值是 Some，执行 transform 函数，并且返回 Some 封装的结果，否则返回 None。

## 契约

参数：

- transform: (T)-> R - 映射函数。

返回值：

- Option\<R> - 如果当前实例值是 Some，执行 transform 函数，并且返回 Option\<R> 类型的结果，否则返回 None。
