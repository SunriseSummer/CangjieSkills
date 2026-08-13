<!-- cj-doc kind="api-extension" level="6" id="std.binary.interface.bigendianorder.extension.extend-uint16-bigendianorder-uint16" parent="std.binary.interface.bigendianorder" -->
# extend UInt16 <: BigEndianOrder<UInt16>

[← BigEndianOrder<T>](../index.md)

`extend UInt16 <: BigEndianOrder<UInt16>`

为 UInt16 扩展 BigEndianOrder 接口，以实现将 UInt16 值和大端序字节序列的转换。

## 成员

| 签名 | 功能 |
|---|---|
| [`static readBigEndian(buffer: Array<UInt8>): UInt16`](../readbigendian/index.md) | 从字节数组中以大端序的方式读取一个 UInt16 值。 |
| [`writeBigEndian(buffer: Array<UInt8>): Int64`](../writebigendian/index.md) | 将 UInt16 值以大端序的方式写入字节数组中。 |
