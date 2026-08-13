<!-- cj-doc kind="api-extension" level="6" id="std.binary.interface.bigendianorder.extension.extend-bool-bigendianorder-bool" parent="std.binary.interface.bigendianorder" -->
# extend Bool <: BigEndianOrder<Bool>

[← BigEndianOrder<T>](../index.md)

`extend Bool <: BigEndianOrder<Bool>`

为 Bool 扩展 BigEndianOrder 接口，以实现将 Bool 值和大端序字节序列的转换。

## 成员

| 签名 | 功能 |
|---|---|
| [`static readBigEndian(buffer: Array<UInt8>): Bool`](../readbigendian/index.md) | 从字节数组中以大端序的方式读取一个 Bool 值。 |
| [`writeBigEndian(buffer: Array<UInt8>): Int64`](../writebigendian/index.md) | 将 Bool 值以大端序的方式写入字节数组中。 |
