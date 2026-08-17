<!-- cj-doc kind="example-category" level="3" id="examples.binary" parent="examples" -->
# 字节缓冲与端序

[← 应用示例](../index.md)

选择字节字面量或显式数值转换，在缓冲中读写数据，并按明确端序恢复整数。

| 示例 | 教学目标 |
|---|---|
| [用 ByteBuffer 组装字节数据](bytebuffer.md) | 写入数据、调整读取位置并取得剩余字节，避免向空目标数组读取。 |
| [按大端序读取 Int64](big-endian.md) | 从至少八字节的缓冲区恢复整数，并遵守 1.1.3 的实际异常契约。 |
| [选择字节字面量或数值转换](byte-literal-conversion.md) | 固定 ASCII 用 b'x'，固定整数用 u8 后缀，运行期数值才调用 UInt8(value)；Byte 与 UInt8 是同一类型。 |
