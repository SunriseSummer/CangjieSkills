<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.stream.interface.jsonserializable" parent="stdx.encoding.json.stream" -->
# JsonSerializable

[← stdx.encoding.json.stream](../../index.md)

`JsonSerializable`

自定义类型实现 `toJson(JsonWriter)` 以流式写出 JSON；对象和数组须显式配对 `startObject/endObject`、`startArray/endArray`。

## 关键契约

Windows x86_64 cjnative 1.0.5 + stdx 1.0.5.1 限制：

- 发布 API 声明 `Array<T>` 和 `Option<T>` 实现本接口，但直接把这些复合值传给 `JsonWriter.writeValue` 的运行路径实测可能因接口函数表缺失而崩溃。
- 在该组合下，对 Option 用 `match` 后调用 `writeValue` 或 `writeNullValue`；对数组使用 `startArray()`、逐元素 `writeValue`、`endArray()`。标量扩展和自定义类型接口仍可正常使用。

## 方法

| 签名 | 功能 |
|---|---|
| [`toJson(w: JsonWriter): Unit`](tojson/index.md) | 将实现了 JsonSerializable 接口的类型写入参数 `w` 指定的 JsonWriter 实例中。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend BigInt <: JsonSerializable`](extensions/extend-bigint-jsonserializable.md) | 为 BigInt 类型提供序列化到 JSON 数据流的接口。 |
| [`extend Bool <: JsonSerializable`](extensions/extend-bool-jsonserializable.md) | 为 Bool 类型提供序列化到 JSON 数据流的接口。 |
| [`extend DateTime <: JsonSerializable`](extensions/extend-datetime-jsonserializable.md) | 为 DateTime 类型实现 JsonSerializable 接口。 |
| [`extend Decimal <: JsonSerializable`](extensions/extend-decimal-jsonserializable.md) | 为 Decimal 类型提供序列化到 JSON 数据流的接口。 |
| [`extend Float16 <: JsonSerializable`](extensions/extend-float16-jsonserializable.md) | 为 Float16 类型提供序列化到 JSON 数据流的接口。 |
| [`extend Float32 <: JsonSerializable`](extensions/extend-float32-jsonserializable.md) | 为 Float32 类型提供序列化到 JSON 数据流的接口。 |
| [`extend Float64 <: JsonSerializable`](extensions/extend-float64-jsonserializable.md) | 为 Float64 类型提供序列化到 JSON 数据流的接口。 |
| [`extend String <: JsonSerializable`](extensions/extend-string-jsonserializable.md) | 为 String 类型提供序列化到 JSON 数据流的接口。 |
| [`extend Int16 <: JsonSerializable`](extensions/extend-int16-jsonserializable.md) | 为 Int16 类型提供序列化到 JSON 数据流的接口。 |
| [`extend Int32 <: JsonSerializable`](extensions/extend-int32-jsonserializable.md) | 为 Int32 类型提供序列化到 JSON 数据流的接口。 |
| [`extend Int64 <: JsonSerializable`](extensions/extend-int64-jsonserializable.md) | 为 Int64 类型提供序列化到 JSON 数据流的接口。 |
| [`extend Int8 <: JsonSerializable`](extensions/extend-int8-jsonserializable.md) | 为 Int8 类型提供序列化到 JSON 数据流的接口。 |
| [`extend IntNative <: JsonSerializable`](extensions/extend-intnative-jsonserializable.md) | 为 IntNative 类型提供序列化到 JSON 数据流的接口。 |
| [`extend UInt16 <: JsonSerializable`](extensions/extend-uint16-jsonserializable.md) | 为 UInt16 类型提供序列化到 JSON 数据流的接口。 |
| [`extend UInt32 <: JsonSerializable`](extensions/extend-uint32-jsonserializable.md) | 为 UInt32 类型提供序列化到 JSON 数据流的接口。 |
| [`extend UInt64 <: JsonSerializable`](extensions/extend-uint64-jsonserializable.md) | 为 UInt64 类型提供序列化到 JSON 数据流的接口。 |
| [`extend UInt8 <: JsonSerializable`](extensions/extend-uint8-jsonserializable.md) | 为 UInt8 类型提供序列化到 JSON 数据流的接口。 |
| [`extend UIntNative <: JsonSerializable`](extensions/extend-uintnative-jsonserializable.md) | 为 UIntNative 类型提供序列化到 JSON 数据流的接口。 |
| [`extend<T> Array<T> <: JsonSerializable where T <: JsonSerializable`](extensions/extend-t-array-t-jsonserializable-where-t-jsonserializable.md) | 为 Array<T> 类型提供序列化到 JSON 数据流的接口。 |
| [`extend<T> ArrayList<T> <: JsonSerializable where T <: JsonSerializable`](extensions/extend-t-arraylist-t-jsonserializable-where-t-jsonserializable.md) | 为 ArrayList<T> 类型提供序列化到 JSON 数据流的接口。 |
| [`extend<T> Option<T> <: JsonSerializable where T <: JsonSerializable`](extensions/extend-t-option-t-jsonserializable-where-t-jsonserializable.md) | 为 Option<T> 类型提供序列化到 JSON 数据流的接口。 |
| [`extend<V> HashMap<String, V> <: JsonSerializable where V <: JsonSerializable`](extensions/extend-v-hashmap-string-v-jsonserializable-where-v-jsonserializable.md) | 为 HashMap<String, T> 类型提供序列化到 JSON 数据流的接口。 |
