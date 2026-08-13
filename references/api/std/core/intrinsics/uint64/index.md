<!-- cj-doc kind="api-type" level="5" id="std.core.intrinsic.uint64" parent="std.core" -->
# UInt64

[← std.core](../../index.md)

表示 64 位无符号整型，表示范围为 [0, 2^{64} - 1]。

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend UInt64`](extensions/extend-uint64.md) | 拓展 64 位无符号整数以支持一些数学常数。 |
| [`extend UInt64 <: Comparable<UInt64>`](extensions/extend-uint64-comparable-uint64.md) | 为 UInt64 类型扩展 Comparable<UInt64> 接口，支持比较操作。 |
| [`extend UInt64 <: Countable<UInt64>`](extensions/extend-uint64-countable-uint64.md) | 为 UInt64 类型扩展 Countable<UInt64> 接口，支持计数操作。 |
| [`extend UInt64 <: Hashable`](extensions/extend-uint64-hashable.md) | 为 UInt64 类型扩展 Hashable 接口，支持计算哈希值。 |
| [`extend UInt64 <: ToString`](extensions/extend-uint64-tostring.md) | 这里为 UInt64 类型扩展 ToString 接口，实现向 String 类型的转换。 |
