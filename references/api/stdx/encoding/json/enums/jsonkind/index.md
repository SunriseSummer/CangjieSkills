<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.enum.jsonkind" parent="stdx.encoding.json" -->
# JsonKind

[← stdx.encoding.json](../../index.md)

`JsonKind`

`JsonKind` 标识 JsonValue 的七种形态；1.0.5.1 未实现 Equatable，须用 `match` 判别而不能用 `==`/`!=`。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`JsArray`](value-jsarray.md) | 表示 `JSON` 类型中的数组类型。 |
| [`JsBool`](value-jsbool.md) | 表示 `true` 或者 `false` 类型。 |
| [`JsFloat`](value-jsfloat.md) | 表示值为浮点数的 `number` 类型。 |
| [`JsInt`](value-jsint.md) | 表示值为整数的 `number` 类型。 |
| [`JsNull`](value-jsnull.md) | 表示 `null` 类型。 |
| [`JsObject`](value-jsobject.md) | 表示 `JSON` 类型中的对象类型。 |
| [`JsString`](value-jsstring.md) | 表示 `string` 类型。 |
