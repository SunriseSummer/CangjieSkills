<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.class.jsonfloat" parent="stdx.encoding.json" -->
# JsonFloat

[← stdx.encoding.json](../../index.md)

`JsonFloat <: JsonValue`

此类为 JsonValue 实现子类，主要用于封装浮点类型的 JSON 数据。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(fv: Float64)`](init.md) | 将指定的 Float64 类型实例封装成 JsonFloat 实例。 |
| [`init(v: Int64)`](init.md) | 将指定的 Int64 类型实例封装成 JsonFloat 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`getValue(): Float64`](getvalue.md) | 获取 JsonFloat 中 value 的实际值。 |
| [`kind(): JsonKind`](kind.md) | 返回当前 JsonFloat 所属的 JsonKind 类型（JsFloat）。 |
| [`toJsonString(): String`](tojsonstring.md) | 将 JsonFloat 转换为 JSON 格式的 (带有空格换行符) 字符串。 |
| [`toString(): String`](tostring.md) | 将 JsonFloat 转换为字符串。 |
| [`func toJsonStringWithoutEscaping(): String`](tojsonstringwithoutescaping.md) | 等同 toJsonString()。 |
| [`func toStringWithoutEscaping(): String`](tostringwithoutescaping.md) | 等同 toString()。 |
