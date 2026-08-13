<!-- cj-doc kind="api-member" level="7" id="std.core.enum.option.flatten" parent="std.core.enum.option.extension.extend-t-option-option-t" -->
# Option<T>.flatten

[← extend<T> Option<Option<T>>](extensions/extend-t-option-option-t.md)

## 签名

```cangjie role=signature
public func flatten(): Option<T>
```

将 Option<Option<T>> 类型展开，如果当前实例是 Some(Option<T>.Some(v)), 展开后的结果为 Some(v)。

## 契约

返回值：

- Option\<T> - Option\<Option\<T>> 类型展开后的结果。
