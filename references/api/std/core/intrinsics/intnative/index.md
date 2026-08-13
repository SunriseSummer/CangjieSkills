<!-- cj-doc kind="api-type" level="5" id="std.core.intrinsic.intnative" parent="std.core" -->
# IntNative

[← std.core](../../index.md)

表示平台相关的有符号整型，其长度与当前系统的位宽一致。

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend IntNative`](extensions/extend-intnative.md) | 拓展平台相关有符号整数以支持一些数学常数。 |
| [`extend IntNative <: Comparable<IntNative>`](extensions/extend-intnative-comparable-intnative.md) | 为 IntNative 类型扩展 Comparable<IntNative> 接口，支持比较操作。 |
| [`extend IntNative <: Countable<IntNative>`](extensions/extend-intnative-countable-intnative.md) | 为 IntNative 类型扩展 Countable<IntNative> 接口，支持计数操作。 |
| [`extend IntNative <: Hashable`](extensions/extend-intnative-hashable.md) | 为 IntNative 类型扩展 Hashable 接口，支持计算哈希值。 |
| [`extend IntNative <: ToString`](extensions/extend-intnative-tostring.md) | 这里为 IntNative 类型扩展 ToString 接口，实现向 String 类型的转换。 |
