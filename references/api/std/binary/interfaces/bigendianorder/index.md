<!-- cj-doc kind="api-type" level="5" id="std.binary.interface.bigendianorder" parent="std.binary" -->
# BigEndianOrder<T>

[← std.binary](../../index.md)

`BigEndianOrder<T>`

大端序字节序列转换接口。

## 方法

| 签名 | 功能 |
|---|---|
| [`static readBigEndian(buffer: Array<UInt8>): T`](readbigendian/index.md) | 从字节数组中以大端序的方式读取一个 T 值。 |
| [`writeBigEndian(buffer: Array<UInt8>): Int64`](writebigendian/index.md) | 将 T 值以大端序的方式写入字节数组中。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Bool <: BigEndianOrder<Bool>`](extensions/extend-bool-bigendianorder-bool.md) | 为 Bool 扩展 BigEndianOrder 接口，以实现将 Bool 值和大端序字节序列的转换。 |
| [`extend Float16 <: BigEndianOrder<Float16>`](extensions/extend-float16-bigendianorder-float16.md) | 为 Float16 扩展 BigEndianOrder 接口，以实现将 Float16 值和大端序字节序列的转换。 |
| [`extend Float32 <: BigEndianOrder<Float32>`](extensions/extend-float32-bigendianorder-float32.md) | 为 Float32 扩展 BigEndianOrder 接口，以实现将 Float32 值和大端序字节序列的转换。 |
| [`extend Float64 <: BigEndianOrder<Float64>`](extensions/extend-float64-bigendianorder-float64.md) | 为 Float64 扩展 BigEndianOrder 接口，以实现将 Float64 值和大端序字节序列的转换。 |
| [`extend Int16 <: BigEndianOrder<Int16>`](extensions/extend-int16-bigendianorder-int16.md) | 为 Int16 扩展 BigEndianOrder 接口，以实现将 Int16 值和大端序字节序列的转换。 |
| [`extend Int32 <: BigEndianOrder<Int32>`](extensions/extend-int32-bigendianorder-int32.md) | 为 Int32 扩展 BigEndianOrder 接口，以实现将 Int32 值和大端序字节序列的转换。 |
| [`extend Int64 <: BigEndianOrder<Int64>`](extensions/extend-int64-bigendianorder-int64.md) | 为 Int64 扩展 BigEndianOrder 接口，以实现将 Int64 值和大端序字节序列的转换。 |
| [`extend Int8 <: BigEndianOrder<Int8>`](extensions/extend-int8-bigendianorder-int8.md) | 为 Int8 扩展 BigEndianOrder 接口，以实现将 Int8 值和大端序字节序列的转换。 |
| [`extend UInt16 <: BigEndianOrder<UInt16>`](extensions/extend-uint16-bigendianorder-uint16.md) | 为 UInt16 扩展 BigEndianOrder 接口，以实现将 UInt16 值和大端序字节序列的转换。 |
| [`extend UInt32 <: BigEndianOrder<UInt32>`](extensions/extend-uint32-bigendianorder-uint32.md) | 为 UInt32 扩展 BigEndianOrder 接口，以实现将 UInt32 值和大端序字节序列的转换。 |
| [`extend UInt64 <: BigEndianOrder<UInt64>`](extensions/extend-uint64-bigendianorder-uint64.md) | 为 UInt64 扩展 BigEndianOrder 接口，以实现将 UInt64 值和大端序字节序列的转换。 |
| [`extend UInt8 <: BigEndianOrder<UInt8>`](extensions/extend-uint8-bigendianorder-uint8.md) | 为 UInt8 扩展 BigEndianOrder 接口，以实现将 UInt8 值和大端序字节序列的转换。 |
