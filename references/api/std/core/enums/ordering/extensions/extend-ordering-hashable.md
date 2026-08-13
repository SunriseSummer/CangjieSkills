<!-- cj-doc kind="api-extension" level="6" id="std.core.enum.ordering.extension.extend-ordering-hashable" parent="std.core.enum.ordering" -->
# extend Ordering <: Hashable

[← Ordering](../index.md)

`extend Ordering <: Hashable`

为 Ordering 类型其扩展 Hashable 接口，支持计算哈希值。

## 成员

| 签名 | 功能 |
|---|---|
| [`hashCode(): Int64`](../hashcode.md) | 获取哈希值，GT 的哈希值是 3，EQ 的哈希值是 2，LT 的哈希值是 1。 |
