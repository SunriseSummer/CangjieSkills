<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.class.jsonstring" parent="stdx.encoding.json" -->
# JsonString

[← stdx.encoding.json](../../index.md)

`JsonString <: JsonValue`

此类为 JsonValue 实现子类，主要用于封装字符串类型的 JSON 数据。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(sv: String)`](init.md) | 将指定的 String 类型实例封装成 JsonString 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`getValue(): String`](getvalue.md) | 获取 JsonString 中 value 的实际值。 |
| [`kind(): JsonKind`](kind.md) | 返回当前 JsonString 所属的 JsonKind 类型（JsString）。 |
| [`toJsonString(): String`](tojsonstring.md) | 将 JsonString 转换为 JSON 格式的 (带有空格换行符) 字符串。 |
| [`toString(): String`](tostring.md) | 将 JsonString 转换为字符串。 |
