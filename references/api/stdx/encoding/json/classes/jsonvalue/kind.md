<!-- cj-doc kind="api-member" level="6" id="stdx.encoding.json.class.jsonvalue.kind" parent="stdx.encoding.json.class.jsonvalue" -->
# JsonValue.kind

[← JsonValue](index.md)

## 签名

```cangjie role=signature
public func kind(): JsonKind
```

返回值的 `JsonKind`；显式导入类型并用 `case JsonKind.JsXxx` 匹配，不能用 `==`/`!=` 比较。

## 契约

返回值：

- JsonKind - 当前 JSON 值的实际形态。

1.1.3.1 边界：

- `JsonKind` 未实现 `Equatable<JsonKind>`，不能用 `==`/`!=` 判别；应使用 `match`。
- 显式导入 `stdx.encoding.json.JsonKind`，并优先写全限定模式 `case JsonKind.JsString`。缺少导入时，裸写的 `case JsString` 可能被解释为匹配任意值的变量模式，使后续分支静默不可达。
- 确认 `kind()` 后再调用对应的 `asXxx()`；实际形态不匹配时，窄化方法抛出 `JsonException`。

## 核心指导

读取不可信 JSON 时，先用 `JsonObject.get` 区分字段缺失，再用 `JsonValue.kind()` 与 `match` 判别形态，确认后才调用 `asString()` 等窄化方法。`get` 在缺键时返回 `None`；对象下标 `[]` 缺键、或 `asXxx()` 与实际形态不符时会抛 `JsonException`。

stdx 1.1.3.1 的 `JsonKind` 没有实现 `Equatable<JsonKind>`，不能用 `==`/`!=` 比较。显式导入 `JsonKind`，并在模式中写全限定构造器（如 `JsonKind.JsString`）；如果误写成未解析到枚举构造器的裸 `case JsString`，它会成为匹配任意值的变量模式，后续分支可能静默不可达。

```cangjie cjtest=run id=api.stdx.json.kind.validation.run form=unit requires=stdx timeout=60s
package stdx_json_kind_validation_example

import stdx.encoding.json.JsonException
import stdx.encoding.json.JsonKind
import stdx.encoding.json.JsonObject
import stdx.encoding.json.JsonValue

func requireString(root: JsonObject, key: String): String {
    let value = match (root.get(key)) {
        case Some(item) => item
        case None => throw JsonException("missing field: ${key}")
    }
    return match (value.kind()) {
        case JsonKind.JsString => value.asString().getValue()
        case _ => throw JsonException("field is not a string: ${key}")
    }
}

main(): Unit {
    let root = JsonValue.fromStr("{\"name\":\"Ada\",\"retries\":3}").asObject()
    println(requireString(root, "name"))

    try {
        requireString(root, "missing")
    } catch (_: JsonException) {
        println("missing-field")
    }

    try {
        requireString(root, "retries")
    } catch (_: JsonException) {
        println("wrong-type")
    }

    try {
        root["missing"]
    } catch (_: JsonException) {
        println("subscript-throws")
    }

    try {
        root["name"].asInt()
    } catch (_: JsonException) {
        println("narrowing-throws")
    }
}
```

```text cjtest=expect for=api.stdx.json.kind.validation.run stream=stdout match=exact
Ada
missing-field
wrong-type
subscript-throws
narrowing-throws
```

下面的反例固定看护“`JsonKind` 不可直接比较”这一 1.1.3.1 契约：

```cangjie cjtest=compile id=api.stdx.json.kind.equality.negative form=unit requires=stdx exit=1 timeout=60s
package stdx_json_kind_equality_negative

import stdx.encoding.json.JsonKind
import stdx.encoding.json.JsonValue

main(): Unit {
    let kind = JsonValue.fromStr("null").kind()
    println(kind != JsonKind.JsNull)
}
```

```text cjtest=expect for=api.stdx.json.kind.equality.negative stream=stderr match=contains
invalid binary operator '!='
```
