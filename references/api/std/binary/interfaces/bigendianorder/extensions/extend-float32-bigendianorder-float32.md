<!-- cj-doc kind="api-extension" level="6" id="std.binary.interface.bigendianorder.extension.extend-float32-bigendianorder-float32" parent="std.binary.interface.bigendianorder" -->
# extend Float32 <: BigEndianOrder<Float32>

[← BigEndianOrder<T>](../index.md)

`extend Float32 <: BigEndianOrder<Float32>`

为 Float32 扩展 BigEndianOrder 接口，以实现将 Float32 值和大端序字节序列的转换。

## 成员

| 签名 | 功能 |
|---|---|
| [`static readBigEndian(buffer: Array<UInt8>): Float32`](../readbigendian/index.md) | 从字节数组中以大端序的方式读取一个 Float32 值。 |
| [`writeBigEndian(buffer: Array<UInt8>): Int64`](../writebigendian/index.md) | 将 Float32 值以大端序的方式写入字节数组中。 |
