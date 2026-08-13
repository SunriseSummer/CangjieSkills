<!-- cj-doc kind="api-extension" level="6" id="std.binary.interface.bigendianorder.extension.extend-uint8-bigendianorder-uint8" parent="std.binary.interface.bigendianorder" -->
# extend UInt8 <: BigEndianOrder<UInt8>

[← BigEndianOrder<T>](../index.md)

`extend UInt8 <: BigEndianOrder<UInt8>`

为 UInt8 扩展 BigEndianOrder 接口，以实现将 UInt8 值和大端序字节序列的转换。

## 成员

| 签名 | 功能 |
|---|---|
| [`static readBigEndian(buffer: Array<UInt8>): UInt8`](../readbigendian/index.md) | 从字节数组中以大端序的方式读取一个 UInt8 值。 |
| [`writeBigEndian(buffer: Array<UInt8>): Int64`](../writebigendian/index.md) | 将 UInt8 值以大端序的方式写入字节数组中。 |
