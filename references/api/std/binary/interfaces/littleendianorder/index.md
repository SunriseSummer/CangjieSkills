<!-- cj-doc kind="api-type" level="5" id="std.binary.interface.littleendianorder" parent="std.binary" -->
# LittleEndianOrder<T>

[← std.binary](../../index.md)

`LittleEndianOrder<T>`

小端序字节序列转换接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`static readLittleEndian(buffer: Array<UInt8>): T`](readlittleendian/index.md) | 从字节数组中以小端序的方式读取一个 T 值。 |
| [`writeLittleEndian(buffer: Array<UInt8>): Int64`](writelittleendian/index.md) | 将 T 值以小端序的方式写入字节数组中。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Bool <: LittleEndianOrder<Bool>`](extensions/extend-bool-littleendianorder-bool.md) | 为 Bool 扩展 LittleEndianOrder 接口，以实现将 Bool 值和小端序字节序列的转换。 |
| [`extend Float16 <: LittleEndianOrder<Float16>`](extensions/extend-float16-littleendianorder-float16.md) | 为 Float16 扩展 LittleEndianOrder 接口，以实现将 Float16 值和小端序字节序列的转换。 |
| [`extend Float32 <: LittleEndianOrder<Float32>`](extensions/extend-float32-littleendianorder-float32.md) | 为 Float32 扩展 LittleEndianOrder 接口，以实现将 Float32 值和小端序字节序列的转换。 |
| [`extend Float64 <: LittleEndianOrder<Float64>`](extensions/extend-float64-littleendianorder-float64.md) | 为 Float64 扩展 LittleEndianOrder 接口，以实现将 Float64 值和小端序字节序列的转换。 |
| [`extend Int16 <: LittleEndianOrder<Int16>`](extensions/extend-int16-littleendianorder-int16.md) | 为 Int16 扩展 LittleEndianOrder 接口，以实现将 Int16 值和小端序字节序列的转换。 |
| [`extend Int32 <: LittleEndianOrder<Int32>`](extensions/extend-int32-littleendianorder-int32.md) | 为 Int32 扩展 LittleEndianOrder 接口，以实现将 Int32 值和小端序字节序列的转换。 |
| [`extend Int64 <: LittleEndianOrder<Int64>`](extensions/extend-int64-littleendianorder-int64.md) | 为 Int64 扩展 LittleEndianOrder 接口，以实现将 Int64 值和小端序字节序列的转换。 |
| [`extend Int8 <: LittleEndianOrder<Int8>`](extensions/extend-int8-littleendianorder-int8.md) | 为 Int8 扩展 LittleEndianOrder 接口，以实现将 Int8 值和小端序字节序列的转换。 |
| [`extend UInt16 <: LittleEndianOrder<UInt16>`](extensions/extend-uint16-littleendianorder-uint16.md) | 为 UInt16 扩展 LittleEndianOrder 接口，以实现将 UInt16 值和小端序字节序列的转换。 |
| [`extend UInt32 <: LittleEndianOrder<UInt32>`](extensions/extend-uint32-littleendianorder-uint32.md) | 为 UInt32 扩展 LittleEndianOrder 接口，以实现将 UInt32 值和小端序字节序列的转换。 |
| [`extend UInt64 <: LittleEndianOrder<UInt64>`](extensions/extend-uint64-littleendianorder-uint64.md) | 为 UInt64 扩展 LittleEndianOrder 接口，以实现将 UInt64 值和小端序字节序列的转换。 |
| [`extend UInt8 <: LittleEndianOrder<UInt8>`](extensions/extend-uint8-littleendianorder-uint8.md) | 为 UInt8 扩展 LittleEndianOrder 接口，以实现将 UInt8 值和小端序字节序列的转换。 |
