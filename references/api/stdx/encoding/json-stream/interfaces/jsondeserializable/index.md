<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.stream.interface.jsondeserializable" parent="stdx.encoding.json.stream" -->
# JsonDeserializable<T>

[← stdx.encoding.json.stream](../../index.md)

`JsonDeserializable<T>`

自定义类型实现静态 `fromJson(JsonReader)` 以流式读取 JSON；读取前用 `peek()` 判别 token，未知值用 `skip()` 完整消费。

## 关键契约

Windows x86_64 cjnative 1.0.5 + stdx 1.0.5.1 限制：

- 发布 API 声明 `Array<T>` 和 `Option<T>` 实现本接口，但直接调用 `readValue<Array<T>>()` 或 `readValue<Option<T>>()` 实测可能因接口函数表缺失而崩溃。
- 在该组合下，Option 先用 `peek()` 判断 `JsonToken.JsonNull`；数组用 `startArray()`、循环读取元素直到 `EndArray`、再 `endArray()`。

## 方法

| 签名 | 功能 |
|---|---|
| [`static fromJson(r: JsonReader): T`](fromjson/index.md) | 从参数 `r` 指定的 JsonReader 实例中读取一个 `T` 类型对象。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend BigInt <: JsonDeserializable<BigInt>`](extensions/extend-bigint-jsondeserializable-bigint.md) | 为 BigInt 类型实现 JsonDeserializable 接口。 |
| [`extend Bool <: JsonDeserializable<Bool>`](extensions/extend-bool-jsondeserializable-bool.md) | 为 Bool 类型实现 JsonDeserializable 接口。 |
| [`extend DateTime <: JsonDeserializable<DateTime>`](extensions/extend-datetime-jsondeserializable-datetime.md) | 为 DateTime 类型实现 JsonDeserializable 接口。 |
| [`extend Decimal <: JsonDeserializable<Decimal>`](extensions/extend-decimal-jsondeserializable-decimal.md) | 为 Decimal 类型实现 JsonDeserializable 接口。 |
| [`extend Float16 <: JsonDeserializable<Float16>`](extensions/extend-float16-jsondeserializable-float16.md) | 为 Float16 类型实现 JsonDeserializable 接口。 |
| [`extend Float32 <: JsonDeserializable<Float32>`](extensions/extend-float32-jsondeserializable-float32.md) | 为 Float32 类型实现 JsonDeserializable 接口。 |
| [`extend Float64 <: JsonDeserializable<Float64>`](extensions/extend-float64-jsondeserializable-float64.md) | 为 Float64 类型实现 JsonDeserializable 接口。 |
| [`extend String <: JsonDeserializable<String>`](extensions/extend-string-jsondeserializable-string.md) | 为 String 类型实现 JsonDeserializable 接口。 |
| [`extend Int16 <: JsonDeserializable<Int16>`](extensions/extend-int16-jsondeserializable-int16.md) | 为 Int16 类型实现 JsonDeserializable 接口。 |
| [`extend Int32 <: JsonDeserializable<Int32>`](extensions/extend-int32-jsondeserializable-int32.md) | 为 Int32 类型实现 JsonDeserializable 接口。 |
| [`extend Int64 <: JsonDeserializable<Int64>`](extensions/extend-int64-jsondeserializable-int64.md) | 为 Int64 类型实现 JsonDeserializable 接口。 |
| [`extend Int8 <: JsonDeserializable<Int8>`](extensions/extend-int8-jsondeserializable-int8.md) | 为 Int8 类型实现 JsonDeserializable 接口。 |
| [`extend IntNative <: JsonDeserializable<IntNative>`](extensions/extend-intnative-jsondeserializable-intnative.md) | 为 IntNative 类型实现 JsonDeserializable 接口。 |
| [`extend UInt16 <: JsonDeserializable<UInt16>`](extensions/extend-uint16-jsondeserializable-uint16.md) | 为 UInt16 类型实现 JsonDeserializable 接口。 |
| [`extend UInt32 <: JsonDeserializable<UInt32>`](extensions/extend-uint32-jsondeserializable-uint32.md) | 为 UInt32 类型实现 JsonDeserializable 接口。 |
| [`extend UInt64 <: JsonDeserializable<UInt64>`](extensions/extend-uint64-jsondeserializable-uint64.md) | 为 UInt64 类型实现 JsonDeserializable 接口。 |
| [`extend UInt8 <: JsonDeserializable<UInt8>`](extensions/extend-uint8-jsondeserializable-uint8.md) | 为 UInt8 类型实现 JsonDeserializable 接口。 |
| [`extend UIntNative <: JsonDeserializable<UIntNative>`](extensions/extend-uintnative-jsondeserializable-uintnative.md) | 为 UIntNative 类型实现 JsonDeserializable 接口。 |
| [`extend<T> Array<T> <: JsonDeserializable<Array<T>> where T <: JsonDeserializable<T>`](extensions/extend-t-array-t-jsondeserializable-array-t-where-t-jsondeserializable-t.md) | 为 Array<T> 类型实现 JsonDeserializable 接口。 |
| [`extend<T> ArrayList<T> <: JsonDeserializable<ArrayList<T>> where T <: JsonDeserializable<T>`](extensions/extend-t-arraylist-t-jsondeserializable-arraylist-t-where-t-jso-9a74c610.md) | 为 ArrayList 类型实现 JsonDeserializable 接口。 |
| [`extend<T> Option<T> <: JsonDeserializable<Option<T>> where T <: JsonDeserializable<T>`](extensions/extend-t-option-t-jsondeserializable-option-t-where-t-jsondeser-e7c1069a.md) | 为 Option 类型实现 JsonDeserializable 接口。 |
| [`extend<T> HashMap<String, T> <: JsonDeserializable<HashMap<String, T>> where T <: JsonDeserializable<T>`](extensions/extend-t-hashmap-string-t-jsondeserializable-hashmap-string-t-w-ead83c91.md) | 为 HashMap 类型实现 JsonDeserializable 接口。 |
