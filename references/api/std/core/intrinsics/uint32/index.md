<!-- cj-doc kind="api-type" level="5" id="std.core.intrinsic.uint32" parent="std.core" -->
# UInt32

[← std.core](../../index.md)

表示 32 位无符号整型，表示范围为 [0, 2^{32} - 1]。

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend UInt32`](extensions/extend-uint32.md) | 拓展 32 位无符号整数以支持一些数学常数。 |
| [`extend UInt32 <: Comparable<UInt32>`](extensions/extend-uint32-comparable-uint32.md) | 为 UInt32 类型扩展 Comparable<UInt32> 接口，支持比较操作。 |
| [`extend UInt32 <: Countable<UInt32>`](extensions/extend-uint32-countable-uint32.md) | 为 UInt32 类型扩展 Countable<UInt32> 接口，支持计数操作。 |
| [`extend UInt32 <: Hashable`](extensions/extend-uint32-hashable.md) | 为 UInt32 类型扩展 Hashable 接口，支持计算哈希值。 |
| [`extend UInt32 <: ToString`](extensions/extend-uint32-tostring.md) | 这里为 UInt32 类型扩展 ToString 接口，实现向 String 类型的转换。 |
