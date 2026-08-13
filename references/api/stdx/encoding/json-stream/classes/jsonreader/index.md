<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.stream.class.jsonreader" parent="stdx.encoding.json.stream" -->
# JsonReader

[← stdx.encoding.json.stream](../../index.md)

`JsonReader`

此类提供 JSON 数据流转仓颉对象的反序列化能力。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(inputStream: InputStream)`](init.md) | 根据输入流创建一个 JsonReader， JsonReader 从输入流中读取数据时，将跳过非 JsonString 中的空字符（'\0', '\t', '\n', '\r'）。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`endArray(): Unit`](endarray.md) | 从输入流的当前位置跳过空白字符后消耗一个 ']' 字符，endArray 必须有一个 startArray 与之对应。 |
| [`endObject(): Unit`](endobject.md) | 从输入流的当前位置跳过空白字符后消耗一个 '}' 字符，endObject 必须有一个 startObject 与之对应。 |
| [`peek(): Option<JsonToken>`](peek.md) | 获取输入流的下一个 JsonToken 的类型，不保证下一个 JsonToken 的格式一定正确。 |
| [`readName(): String`](readname.md) | 从输入流的当前位置读取一个 name。 |
| [`readValue<T>(): T where T <: JsonDeserializable<T>`](readvalue.md) | 从输入流的当前位置读取一个 value。 |
| [`readValueBytes(): Array<Byte>`](readvaluebytes.md) | 读取输入流的下一组原始数据(字节数组)，不进行转义等操作。 |
| [`skip(): Unit`](skip.md) | 从输入流的当前位置跳过一组数据。 |
| [`startArray(): Unit`](startarray.md) | 从输入流的当前位置跳过空白字符后消耗一个 '[' 字符。 |
| [`startObject(): Unit`](startobject.md) | 从输入流的当前位置跳过空白字符后消耗一个 '{' 字符。 |
