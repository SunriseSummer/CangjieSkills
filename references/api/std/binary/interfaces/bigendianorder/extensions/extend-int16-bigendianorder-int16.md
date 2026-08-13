<!-- cj-doc kind="api-extension" level="6" id="std.binary.interface.bigendianorder.extension.extend-int16-bigendianorder-int16" parent="std.binary.interface.bigendianorder" -->
# extend Int16 <: BigEndianOrder<Int16>

[← BigEndianOrder<T>](../index.md)

`extend Int16 <: BigEndianOrder<Int16>`

为 Int16 扩展 BigEndianOrder 接口，以实现将 Int16 值和大端序字节序列的转换。

## 成员

| 签名 | 功能 |
|---|---|
| [`static readBigEndian(buffer: Array<UInt8>): Int16`](../readbigendian/index.md) | 从字节数组中以大端序的方式读取一个 Int16 值。 |
| [`writeBigEndian(buffer: Array<UInt8>): Int64`](../writebigendian/index.md) | 将 Int16 值以大端序的方式写入字节数组中。 |
