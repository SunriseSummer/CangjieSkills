<!-- cj-doc kind="api-extension" level="6" id="std.binary.interface.littleendianorder.extension.extend-uint32-littleendianorder-uint32" parent="std.binary.interface.littleendianorder" -->
# extend UInt32 <: LittleEndianOrder<UInt32>

[← LittleEndianOrder<T>](../index.md)

`extend UInt32 <: LittleEndianOrder<UInt32>`

为 UInt32 扩展 LittleEndianOrder 接口，以实现将 UInt32 值和小端序字节序列的转换。

## 成员

| 签名 | 功能 |
|---|---|
| [`static readLittleEndian(buffer: Array<UInt8>): UInt32`](../readlittleendian/index.md) | 从字节数组中以小端序的方式读取一个 UInt32 值。 |
| [`writeLittleEndian(buffer: Array<UInt8>): Int64`](../writelittleendian/index.md) | 将 UInt32 值以小端序的方式写入字节数组中。 |
