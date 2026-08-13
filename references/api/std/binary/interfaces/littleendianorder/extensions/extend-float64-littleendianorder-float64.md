<!-- cj-doc kind="api-extension" level="6" id="std.binary.interface.littleendianorder.extension.extend-float64-littleendianorder-float64" parent="std.binary.interface.littleendianorder" -->
# extend Float64 <: LittleEndianOrder<Float64>

[← LittleEndianOrder<T>](../index.md)

`extend Float64 <: LittleEndianOrder<Float64>`

为 Float64 扩展 LittleEndianOrder 接口，以实现将 Float64 值和小端序字节序列的转换。

## 成员

| 签名 | 功能 |
|---|---|
| [`static readLittleEndian(buffer: Array<UInt8>): Float64`](../readlittleendian/index.md) | 从字节数组中以小端序的方式读取一个 Float64 值。 |
| [`writeLittleEndian(buffer: Array<UInt8>): Int64`](../writelittleendian/index.md) | 将 Float64 值以小端序的方式写入字节数组中。 |
