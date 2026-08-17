<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.class.jsonint" parent="stdx.encoding.json" -->
# JsonInt

[← stdx.encoding.json](../../index.md)

`JsonInt <: JsonValue`

此类为 JsonValue 实现子类，主要用于封装整数类型的 JSON 数据。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(iv: Int64)`](init.md) | 将指定的 Int64 类型实例封装成 JsonInt 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`getValue(): Int64`](getvalue.md) | 获取 JsonInt 中 value 的实际值。 |
| [`kind(): JsonKind`](kind.md) | 返回当前 JsonInt 所属的 JsonKind 类型（JsInt）。 |
| [`toJsonString(): String`](tojsonstring.md) | 将 JsonInt 转换为 JSON 格式的 (带有空格换行符) 字符串。 |
| [`toString(): String`](tostring.md) | 将 JsonInt 转换为字符串。 |
| [`func toJsonStringWithoutEscaping(): String`](tojsonstringwithoutescaping.md) | 等同 toJsonString()。 |
| [`func toStringWithoutEscaping(): String`](tostringwithoutescaping.md) | 等同 toString()。 |
