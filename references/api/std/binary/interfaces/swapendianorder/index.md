<!-- cj-doc kind="api-type" level="5" id="std.binary.interface.swapendianorder" parent="std.binary" -->
# SwapEndianOrder<T>

[← std.binary](../../index.md)

`SwapEndianOrder<T>`

反转字节顺序接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`swapBytes(): T`](swapbytes.md) | 反转 T 值的字节顺序。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Int16 <: SwapEndianOrder<Int16>`](extensions/extend-int16-swapendianorder-int16.md) | 为 Int16 扩展 SwapEndianOrder 接口，以实现将 Int16 值的字节顺序反转。 |
| [`extend Int32 <: SwapEndianOrder<Int32>`](extensions/extend-int32-swapendianorder-int32.md) | 为 Int32 扩展 SwapEndianOrder 接口，以实现将 Int32 值的字节顺序反转。 |
| [`extend Int64 <: SwapEndianOrder<Int64>`](extensions/extend-int64-swapendianorder-int64.md) | 为 Int64 扩展 SwapEndianOrder 接口，以实现将 Int64 值的字节顺序反转。 |
| [`extend Int8 <: SwapEndianOrder<Int8>`](extensions/extend-int8-swapendianorder-int8.md) | 为 Int8 扩展 SwapEndianOrder 接口，以实现将 Int8 值的字节顺序反转。 |
| [`extend UInt16 <: SwapEndianOrder<UInt16>`](extensions/extend-uint16-swapendianorder-uint16.md) | 为 UInt16 扩展 SwapEndianOrder 接口，以实现将 UInt16 值的字节顺序反转。 |
| [`extend UInt32 <: SwapEndianOrder<UInt32>`](extensions/extend-uint32-swapendianorder-uint32.md) | 为 UInt32 扩展 SwapEndianOrder 接口，以实现将 UInt32 值的字节顺序反转。 |
| [`extend UInt64 <: SwapEndianOrder<UInt64>`](extensions/extend-uint64-swapendianorder-uint64.md) | 为 UInt64 扩展 SwapEndianOrder 接口，以实现将 UInt64 值的字节顺序反转。 |
| [`extend UInt8 <: SwapEndianOrder<UInt8>`](extensions/extend-uint8-swapendianorder-uint8.md) | 为 UInt8 扩展 SwapEndianOrder 接口，以实现将 UInt8 值的字节顺序反转。 |
