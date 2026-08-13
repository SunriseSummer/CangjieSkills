<!-- cj-doc kind="api-extension" level="6" id="std.binary.interface.littleendianorder.extension.extend-bool-littleendianorder-bool" parent="std.binary.interface.littleendianorder" -->
# extend Bool <: LittleEndianOrder<Bool>

[← LittleEndianOrder<T>](../index.md)

`extend Bool <: LittleEndianOrder<Bool>`

为 Bool 扩展 LittleEndianOrder 接口，以实现将 Bool 值和小端序字节序列的转换。

## 成员

| 签名 | 功能 |
|---|---|
| [`static readLittleEndian(buffer: Array<UInt8>): Bool`](../readlittleendian/index.md) | 从字节数组中以小端序的方式读取一个 Bool 值。 |
| [`writeLittleEndian(buffer: Array<UInt8>): Int64`](../writelittleendian/index.md) | 将 Bool 值以小端序的方式写入字节数组中。 |
