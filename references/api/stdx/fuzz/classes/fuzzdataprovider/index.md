<!-- cj-doc kind="api-type" level="5" id="stdx.fuzz.fuzz.class.fuzzdataprovider" parent="stdx.fuzz.fuzz" -->
# FuzzDataProvider

[← stdx.fuzz.fuzz](../../index.md)

`open FuzzDataProvider`

FuzzDataProvider 是一个工具类，目的是将变异数据的字节流转化为标准的仓颉基本数据。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`data: Array<UInt8>`](field-data.md) | 变异数据。 |
| [`offset: Int64`](field-offset.md) | 已转化的字节数。 |
| [`remainingBytes: Int64`](field-remainingbytes.md) | 剩余字节数。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`open consumeAll(): Array<UInt8>`](consumeall.md) | 将所有数据转换成 UInt8 类型数组。 |
| [`open consumeAllAsAscii(): String`](consumeallasascii.md) | 将所有数据转换成 Ascii String 类型。 |
| [`open consumeAllAsString(): String`](consumeallasstring.md) | 将所有数据转换成 utf8 String 类型。 |
| [`open consumeAsciiString(maxLength: Int64): String`](consumeasciistring.md) | 将数据转换成 Ascii String 类型实例。 |
| [`open consumeBool(): Bool`](consumebool.md) | 将数据转换成 Bool 类型实例。 |
| [`open consumeBools(count: Int64): Array<Bool>`](consumebools.md) | 将指定数量的数据转换成 Bool 类型数组。 |
| [`open consumeByte(): Byte`](consumebyte.md) | 将数据转换成 Byte 类型实例。 |
| [`open consumeBytes(count: Int64): Array<Byte>`](consumebytes.md) | 将指定数量的数据转换成 Byte 类型数组。 |
| [`open consumeFloat32(): Float32`](consumefloat32.md) | 将数据转换成 Float32 类型实例。 |
| [`open consumeFloat64(): Float64`](consumefloat64.md) | 将数据转换成 Float64 类型实例。 |
| [`open consumeInt16(): Int16`](consumeint16.md) | 将数据转换成 Int16 类型实例。 |
| [`open consumeInt16s(count: Int64): Array<Int16>`](consumeint16s.md) | 将指定数量的数据转换成 Int16 类型数组。 |
| [`open consumeInt32(): Int32`](consumeint32.md) | 将数据转换成 Int32 类型实例。 |
| [`open consumeInt32s(count: Int64): Array<Int32>`](consumeint32s.md) | 将指定数量的数据转换成 Int32 类型数组。 |
| [`open consumeInt64(): Int64`](consumeint64.md) | 将数据转换成 Int64 类型实例。 |
| [`open consumeInt64s(count: Int64): Array<Int64>`](consumeint64s.md) | 将指定数量的数据转换成 Int64 类型数组。 |
| [`open consumeInt8(): Int8`](consumeint8.md) | 将数据转换成 Int8 类型实例。 |
| [`open consumeInt8s(count: Int64): Array<Int8>`](consumeint8s.md) | 将指定数量的数据转换成 Int8 类型数组。 |
| [`open consumeRune(): Rune`](consumerune.md) | 将数据转换成 Rune 类型实例。 |
| [`open consumeString(maxLength: Int64): String`](consumestring.md) | 将数据转换成 utf8 String 类型实例。 |
| [`open consumeUInt16(): UInt16`](consumeuint16.md) | 将数据转换成 UInt16 类型实例。 |
| [`open consumeUInt16s(count: Int64): Array<UInt16>`](consumeuint16s.md) | 将指定数量的数据转换成 UInt16 类型数组。 |
| [`open consumeUInt32(): UInt32`](consumeuint32.md) | 将数据转换成 UInt32 类型实例。 |
| [`open consumeUInt32s(count: Int64): Array<UInt32>`](consumeuint32s.md) | 将指定数量的数据转换成 UInt32 类型数组。 |
| [`open consumeUInt64(): UInt64`](consumeuint64.md) | 将数据转换成 UInt64 类型实例。 |
| [`open consumeUInt64s(count: Int64): Array<UInt64>`](consumeuint64s.md) | 将指定数量的数据转换成 UInt64 类型数组。 |
| [`open consumeUInt8(): UInt8`](consumeuint8.md) | 将数据转换成 UInt8 类型实例。 |
| [`open consumeUInt8s(count: Int64): Array<UInt8>`](consumeuint8s.md) | 将指定数量的数据转换成 UInt8 类型数组。 |
| [`static withCangjieData(data: Array<UInt8>): FuzzDataProvider`](withcangjiedata.md) | 使用 Array<UInt8> 类型的数据生成 FuzzDataProvider 类型实例。 |
| [`static unsafe withNativeData(data: CPointer<UInt8>, length: Int64): FuzzDataProvider`](withnativedata.md) | 使用 C 指针数据生成 FuzzDataProvider 类型实例。 |
