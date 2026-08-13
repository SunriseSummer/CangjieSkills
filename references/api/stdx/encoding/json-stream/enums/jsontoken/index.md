<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.stream.enum.jsontoken" parent="stdx.encoding.json.stream" -->
# JsonToken

[← stdx.encoding.json.stream](../../index.md)

`JsonToken <: Equatable<JsonToken> & Hashable`

表示 JSON 编码的字符串中的结构、名称或者值类型。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`BeginArray`](value-beginarray.md) | 表示 JSON 中 array 的开始。 |
| [`BeginObject`](value-beginobject.md) | 表示 JSON 中 object 的开始。 |
| [`EndArray`](value-endarray.md) | 表示 JSON 中 array 的结束。 |
| [`EndObject`](value-endobject.md) | 表示 JSON 中 object 的结束。 |
| [`JsonBool`](value-jsonbool.md) | 表示 JSON 的 bool 类型。 |
| [`JsonNull`](value-jsonnull.md) | 表示 JSON 的 null 类型。 |
| [`JsonNumber`](value-jsonnumber.md) | 表示 JSON 的 number 类型。 |
| [`JsonString`](value-jsonstring.md) | 表示 JSON 的 string 类型。 |
| [`Name`](value-name.md) | 表示 object 中的 name。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`hashCode(): Int64`](hashcode.md) | 获取 JsonToken 对象的 hashCode 值。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator !=(that: JsonToken): Bool`](operator-ne.md) | 判不等。 |
| [`operator ==(that: JsonToken): Bool`](operator-eq.md) | 判等。 |
