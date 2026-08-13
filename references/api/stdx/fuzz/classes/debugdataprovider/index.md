<!-- cj-doc kind="api-type" level="5" id="stdx.fuzz.fuzz.class.debugdataprovider" parent="stdx.fuzz.fuzz" -->
# DebugDataProvider

[← stdx.fuzz.fuzz](../../index.md)

`DebugDataProvider <: FuzzDataProvider`

此类继承了 FuzzDataProvider 类型，额外增加了调试信息。

## 方法

| 签名 | 功能 |
|---|---|
| [`override consumeAll(): Array<UInt8>`](consumeall.md) | 将所有数据转换成 UInt8 类型数组。 |
| [`override consumeAllAsAscii(): String`](consumeallasascii.md) | 将所有数据转换成 Ascii String 类型。 |
| [`override consumeAllAsString(): String`](consumeallasstring.md) | 将所有数据转换成 utf8 String 类型。 |
| [`override consumeAsciiString(maxLength: Int64): String`](consumeasciistring.md) | 将数据转换成 Ascii String 类型实例。 |
| [`override consumeBool(): Bool`](consumebool.md) | 将数据转换成 Bool 类型实例。 |
| [`override consumeBools(count: Int64): Array<Bool>`](consumebools.md) | 将指定数量的数据转换成 Bool 类型数组。 |
| [`override consumeByte(): Byte`](consumebyte.md) | 将数据转换成 Byte 类型实例。 |
| [`override consumeBytes(count: Int64): Array<Byte>`](consumebytes.md) | 将指定数量的数据转换成 Byte 类型数组。 |
| [`override consumeFloat32(): Float32`](consumefloat32.md) | 将数据转换成 Float32 类型实例。 |
| [`override consumeFloat64(): Float64`](consumefloat64.md) | 将数据转换成 Float64 类型实例。 |
| [`override consumeInt16(): Int16`](consumeint16.md) | 将数据转换成 Int16 类型实例。 |
| [`override consumeInt16s(count: Int64): Array<Int16>`](consumeint16s.md) | 将指定数量的数据转换成 Int16 类型数组。 |
| [`override consumeInt32(): Int32`](consumeint32.md) | 将数据转换成 Int32 类型实例。 |
| [`override consumeInt32s(count: Int64): Array<Int32>`](consumeint32s.md) | 将指定数量的数据转换成 Int32 类型数组。 |
| [`override consumeInt64(): Int64`](consumeint64.md) | 将数据转换成 Int64 类型实例。 |
| [`override consumeInt64s(count: Int64): Array<Int64>`](consumeint64s.md) | 将指定数量的数据转换成 Int64 类型数组。 |
| [`override consumeInt8(): Int8`](consumeint8.md) | 将数据转换成 Int8 类型实例。 |
| [`override consumeInt8s(count: Int64): Array<Int8>`](consumeint8s.md) | 将指定数量的数据转换成 Int8 类型数组。 |
| [`override consumeRune(): Rune`](consumerune.md) | 将数据转换成 Rune 类型实例。 |
| [`override consumeString(maxLength: Int64): String`](consumestring.md) | 将数据转换成 utf8 String 类型实例。 |
| [`override consumeUInt16(): UInt16`](consumeuint16.md) | 将数据转换成 UInt16 类型实例。 |
| [`override consumeUInt16s(count: Int64): Array<UInt16>`](consumeuint16s.md) | 将指定数量的数据转换成 UInt16 类型数组。 |
| [`override consumeUInt32(): UInt32`](consumeuint32.md) | 将数据转换成 UInt32 类型实例。 |
| [`override consumeUInt32s(count: Int64): Array<UInt32>`](consumeuint32s.md) | 将指定数量的数据转换成 UInt32 类型数组。 |
| [`override consumeUInt64(): UInt64`](consumeuint64.md) | 将数据转换成 UInt64 类型实例。 |
| [`override consumeUInt64s(count: Int64): Array<UInt64>`](consumeuint64s.md) | 将指定数量的数据转换成 UInt64 类型数组。 |
| [`override consumeUInt8(): UInt8`](consumeuint8.md) | 将数据转换成 UInt8 类型实例。 |
| [`override consumeUInt8s(count: Int64): Array<UInt8>`](consumeuint8s.md) | 将指定数量的数据转换成 UInt8 类型数组。 |
| [`static wrap(dp: FuzzDataProvider): DebugDataProvider`](wrap.md) | 根据 FuzzDataProvider 实例创建 DebugDataProvider 实例。 |
