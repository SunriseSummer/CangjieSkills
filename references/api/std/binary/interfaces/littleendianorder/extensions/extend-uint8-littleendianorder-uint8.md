<!-- cj-doc kind="api-extension" level="6" id="std.binary.interface.littleendianorder.extension.extend-uint8-littleendianorder-uint8" parent="std.binary.interface.littleendianorder" -->
# extend UInt8 <: LittleEndianOrder<UInt8>

[← LittleEndianOrder<T>](../index.md)

`extend UInt8 <: LittleEndianOrder<UInt8>`

为 UInt8 扩展 LittleEndianOrder 接口，以实现将 UInt8 值和小端序字节序列的转换。

## 成员

| 签名 | 功能 |
|---|---|
| [`static readLittleEndian(buffer: Array<UInt8>): UInt8`](../readlittleendian/index.md) | 从字节数组中以小端序的方式读取一个 UInt8 值。 |
| [`writeLittleEndian(buffer: Array<UInt8>): Int64`](../writelittleendian/index.md) | 将 UInt8 值以小端序的方式写入字节数组中。 |
