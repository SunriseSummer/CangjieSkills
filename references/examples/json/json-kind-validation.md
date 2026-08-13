<!-- cj-doc kind="example-leaf" level="4" id="examples.json.json-kind-validation" parent="examples.json" -->
# 校验 JSON 必选字段与类型

[← JSON 与对象序列化](index.md)

缺失字段用 `JsonObject.get` 处理；先以 `match` 判别 `JsonKind`，再调用对应 `asXxx()`。

## 核心指导

读取不可信 JSON 时，先用 `JsonObject.get` 区分字段缺失，再用 `JsonValue.kind()` 与 `match` 判别形态，确认后才调用 `asString()` 等窄化方法。`get` 在缺键时返回 `None`；对象下标 `[]` 缺键、或 `asXxx()` 与实际形态不符时会抛 `JsonException`。

stdx 1.0.5.1 的 `JsonKind` 没有实现 `Equatable<JsonKind>`，不能用 `==`/`!=` 比较。显式导入 `JsonKind`，并在模式中写全限定构造器（如 `JsonKind.JsString`）；如果误写成未解析到枚举构造器的裸 `case JsString`，它会成为匹配任意值的变量模式，后续分支可能静默不可达。

```cangjie cjtest=run id=examples.json.json-kind-validation.api.stdx.json.kind.validation.run form=unit requires=stdx timeout=60s
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

预期标准输出：

```text cjtest=expect for=examples.json.json-kind-validation.api.stdx.json.kind.validation.run stream=stdout match=exact
Ada
missing-field
wrong-type
subscript-throws
narrowing-throws
```

下面的反例固定看护“`JsonKind` 不可直接比较”这一 1.0.5.1 契约：

```cangjie cjtest=compile id=examples.json.json-kind-validation.api.stdx.json.kind.equality.negative form=unit requires=stdx exit=1 timeout=60s
package stdx_json_kind_equality_negative

import stdx.encoding.json.JsonKind
import stdx.encoding.json.JsonValue

main(): Unit {
    let kind = JsonValue.fromStr("null").kind()
    println(kind != JsonKind.JsNull)
}
```

预期标准错误中包含：

```text cjtest=expect for=examples.json.json-kind-validation.api.stdx.json.kind.equality.negative stream=stderr match=contains
invalid binary operator '!='
```
