<!-- cj-doc kind="api-extension" level="6" id="std.binary.interface.bigendianorder.extension.extend-float64-bigendianorder-float64" parent="std.binary.interface.bigendianorder" -->
# extend Float64 <: BigEndianOrder<Float64>

[← BigEndianOrder<T>](../index.md)

`extend Float64 <: BigEndianOrder<Float64>`

为 Float64 扩展 BigEndianOrder 接口，以实现将 Float64 值和大端序字节序列的转换。

## 成员

| 签名 | 功能 |
|---|---|
| [`static readBigEndian(buffer: Array<UInt8>): Float64`](../readbigendian/index.md) | 从字节数组中以大端序的方式读取一个 Float64 值。 |
| [`writeBigEndian(buffer: Array<UInt8>): Int64`](../writebigendian/index.md) | 将 Float64 值以大端序的方式写入字节数组中。 |
