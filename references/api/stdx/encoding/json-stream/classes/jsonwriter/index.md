<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.stream.class.jsonwriter" parent="stdx.encoding.json.stream" -->
# JsonWriter

[← stdx.encoding.json.stream](../../index.md)

`JsonWriter`

JsonWriter 提供了将仓颉对象序列化到 OutputStream 的能力。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`writeConfig = WriteConfig.compact`](field-writeconfig.md) | 序列化格式配置。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(out: OutputStream)`](init.md) | 构造函数，构造一个将数据写入 out 的实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`endArray(): Unit`](endarray.md) | 结束序列化当前的 JSON 数组。 |
| [`endObject(): Unit`](endobject.md) | 结束序列化当前的 JSON object。 |
| [`flush(): Unit`](flush.md) | 将缓存中的数据写入 out，并且调用 out 的 flush 方法。 |
| [`jsonValue(value: String): JsonWriter`](jsonvalue.md) | 将符合 JSON value 规范的原始字符串写入 stream。 |
| [`startArray(): Unit`](startarray.md) | 开始序列化一个新的 JSON 数组，每一个 startArray 都必须有一个 endArray 对应。 |
| [`startObject(): Unit`](startobject.md) | 开始序列化一个新的 JSON object，每一个 startObject 都必须有一个 endObject 对应。 |
| [`writeName(name: String): JsonWriter`](writename.md) | 在 object 结构中写入 name。 |
| [`writeNullValue(): JsonWriter`](writenullvalue.md) | 向流中写入 JSON value null。 |
| [`writeValue<T>(v: T): JsonWriter where T <: JsonSerializable`](writevalue.md) | 将实现了 JsonSerializable 接口的类型写入到 Stream 中。 |
