<!-- cj-doc kind="api-type" level="5" id="std.core.intrinsic.bool" parent="std.core" -->
# Bool

[← std.core](../../index.md)

表示布尔类型，有 `true` 和 `false` 两种取值。

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Bool <: Equatable<Bool>`](extensions/extend-bool-equatable-bool.md) | 为 Bool 类型扩展 Equatable<Bool> 接口，支持判等操作。 |
| [`extend Bool <: Hashable`](extensions/extend-bool-hashable.md) | 为 Bool 类型扩展 Hashable 接口，支持计算哈希值。 |
| [`extend Bool <: ToString`](extensions/extend-bool-tostring.md) | 为 Bool 类型其扩展 ToString 接口，实现向 String 类型的转换。 |
