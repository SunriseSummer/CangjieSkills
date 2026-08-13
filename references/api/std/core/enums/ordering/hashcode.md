<!-- cj-doc kind="api-member" level="7" id="std.core.enum.ordering.hashcode" parent="std.core.enum.ordering.extension.extend-ordering-hashable" -->
# Ordering.hashCode

[← extend Ordering <: Hashable](extensions/extend-ordering-hashable.md)

## 签名

```cangjie role=signature
public func hashCode(): Int64
```

获取哈希值，GT 的哈希值是 3，EQ 的哈希值是 2，LT 的哈希值是 1。

## 契约

返回值：

- Int64 - 哈希值。
