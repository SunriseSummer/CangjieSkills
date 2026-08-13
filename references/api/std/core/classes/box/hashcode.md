<!-- cj-doc kind="api-member" level="7" id="std.core.class.box.hashcode" parent="std.core.class.box.extension.extend-t-box-t-hashable-where-t-hashable" -->
# Box<T>.hashCode

[← extend<T> Box<T> <: Hashable where T <: Hashable](extensions/extend-t-box-t-hashable-where-t-hashable.md)

## 签名

```cangjie role=signature
public func hashCode(): Int64
```

获取 Box 对象的哈希值。

## 契约

实际上该值为 Box 中封装的 `T` 类型实例的哈希值。

返回值：

- Int64 - 当前 Box 对象的哈希值。
