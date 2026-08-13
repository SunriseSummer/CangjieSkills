<!-- cj-doc kind="api-type" level="5" id="std.core.intrinsic.int64" parent="std.core" -->
# Int64

[← std.core](../../index.md)

表示 64 位有符号整型，表示范围为 [-2^{63}, 2^{63} - 1]。

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Int64`](extensions/extend-int64.md) | 拓展 64 位有符号整数以支持一些数学常数。 |
| [`extend Int64 <: Comparable<Int64>`](extensions/extend-int64-comparable-int64.md) | 为 Int64 类型扩展 Comparable<Int64> 接口，支持比较操作。 |
| [`extend Int64 <: Countable<Int64>`](extensions/extend-int64-countable-int64.md) | 为 Int64 类型扩展 Countable<Int64> 接口，支持计数操作。 |
| [`extend Int64 <: Hashable`](extensions/extend-int64-hashable.md) | 为 Int64 类型扩展 Hashable 接口，支持计算哈希值。 |
| [`extend Int64 <: ToString`](extensions/extend-int64-tostring.md) | 这里为 Int64 类型扩展 ToString 接口，实现向 String 类型的转换。 |
