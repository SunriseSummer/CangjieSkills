<!-- cj-doc kind="api-extension" level="6" id="std.binary.interface.littleendianorder.extension.extend-uint64-littleendianorder-uint64" parent="std.binary.interface.littleendianorder" -->
# extend UInt64 <: LittleEndianOrder<UInt64>

[← LittleEndianOrder<T>](../index.md)

`extend UInt64 <: LittleEndianOrder<UInt64>`

为 UInt64 扩展 LittleEndianOrder 接口，以实现将 UInt64 值和小端序字节序列的转换。

## 成员

| 签名 | 功能 |
|---|---|
| [`static readLittleEndian(buffer: Array<UInt8>): UInt64`](../readlittleendian/index.md) | 从字节数组中以小端序的方式读取一个 UInt64 值。 |
| [`writeLittleEndian(buffer: Array<UInt8>): Int64`](../writelittleendian/index.md) | 将 UInt64 值以小端序的方式写入字节数组中。 |
