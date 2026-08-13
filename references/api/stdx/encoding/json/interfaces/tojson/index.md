<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.interface.tojson" parent="stdx.encoding.json" -->
# ToJson

[← stdx.encoding.json](../../index.md)

`ToJson`

用于实现 JsonValue 和 DataModel 的相互转换。

## 方法

| 签名 | 功能 |
|---|---|
| [`static fromJson(jv: JsonValue): DataModel`](fromjson.md) | 将 JsonValue 转化为对象 DataModel。 |
| [`toJson(): JsonValue`](tojson.md) | 将自身转化为 JsonValue。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend DataModel <: ToJson`](extensions/extend-datamodel-tojson.md) | 为 DataModel 类型实现 ToJson 接口。 |
