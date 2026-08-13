<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.class.jsonbool" parent="stdx.encoding.json" -->
# JsonBool

[← stdx.encoding.json](../../index.md)

`JsonBool <: JsonValue`

此类为 JsonValue 实现子类，主要用于封装 true 或者 false 的 JSON 数据。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(bv: Bool)`](init.md) | 将指定的 Bool 类型实例封装成 JsonBool 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`getValue(): Bool`](getvalue.md) | 获取 JsonBool 中 value 的实际值。 |
| [`kind(): JsonKind`](kind.md) | 返回当前 JsonBool 所属的 JsonKind 类型（JsBool）。 |
| [`toJsonString(): String`](tojsonstring.md) | 将 JsonBool 转换为 JSON 格式的 (带有空格换行符) 字符串。 |
| [`toString(): String`](tostring.md) | 将 JsonBool 转换为字符串。 |
