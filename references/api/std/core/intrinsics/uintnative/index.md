<!-- cj-doc kind="api-type" level="5" id="std.core.intrinsic.uintnative" parent="std.core" -->
# UIntNative

[← std.core](../../index.md)

表示平台相关的无符号整型，其长度与当前系统的位宽一致。

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend UIntNative`](extensions/extend-uintnative.md) | 拓展平台相关无符号整数以支持一些数学常数。 |
| [`extend UIntNative <: Comparable<UIntNative>`](extensions/extend-uintnative-comparable-uintnative.md) | 为 UIntNative 类型扩展 Comparable<UIntNative> 接口，支持比较操作。 |
| [`extend UIntNative <: Countable<UIntNative>`](extensions/extend-uintnative-countable.md) | 为 UIntNative 类型扩展 Countable<UIntNative> 接口，支持计数操作。 |
| [`extend UIntNative <: Hashable`](extensions/extend-uintnative-hashable.md) | 为 UIntNative 类型扩展 Hashable 接口，支持计算哈希值。 |
| [`extend UIntNative <: ToString`](extensions/extend-uintnative-tostring.md) | 这里为 UIntNative 类型扩展 ToString 接口，实现向 String 类型的转换。 |
