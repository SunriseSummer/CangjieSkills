<!-- cj-doc kind="api-extension" level="6" id="std.binary.interface.littleendianorder.extension.extend-uint16-littleendianorder-uint16" parent="std.binary.interface.littleendianorder" -->
# extend UInt16 <: LittleEndianOrder<UInt16>

[← LittleEndianOrder<T>](../index.md)

`extend UInt16 <: LittleEndianOrder<UInt16>`

为 UInt16 扩展 LittleEndianOrder 接口，以实现将 UInt16 值和小端序字节序列的转换。

## 成员

| 签名 | 功能 |
|---|---|
| [`static readLittleEndian(buffer: Array<UInt8>): UInt16`](../readlittleendian/index.md) | 从字节数组中以小端序的方式读取一个 UInt16 值。 |
| [`writeLittleEndian(buffer: Array<UInt8>): Int64`](../writelittleendian/index.md) | 将 UInt16 值以小端序的方式写入字节数组中。 |
