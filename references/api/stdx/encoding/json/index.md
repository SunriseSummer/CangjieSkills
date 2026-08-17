<!-- cj-doc kind="api-package" level="4" id="stdx.encoding.json" parent="api.stdx" -->
# stdx.encoding.json

[← stdx 包索引](../../index.md)

在 String、JsonValue 与 DataModel 之间转换 JSON 数据。

包路径：`stdx.encoding.json`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`JsonArray <: JsonValue`](classes/jsonarray/index.md) | JSON 数组容器；1.1.3.1 未实现 `Iterable`，遍历时使用 `getItems()`，或按 `0..size()` 生成索引并用 `operator []` 取值。 |
| [`JsonBool <: JsonValue`](classes/jsonbool/index.md) | 此类为 JsonValue 实现子类，主要用于封装 true 或者 false 的 JSON 数据。 |
| [`JsonFloat <: JsonValue`](classes/jsonfloat/index.md) | 此类为 JsonValue 实现子类，主要用于封装浮点类型的 JSON 数据。 |
| [`JsonInt <: JsonValue`](classes/jsonint/index.md) | 此类为 JsonValue 实现子类，主要用于封装整数类型的 JSON 数据。 |
| [`JsonNull <: JsonValue`](classes/jsonnull/index.md) | 此类为 JsonValue 实现子类，主要用于封装 null 的 JSON 数据。 |
| [`JsonObject <: JsonValue`](classes/jsonobject/index.md) | JSON 对象容器；缺键读取优先用 `get` 取得 Option，`operator []` 在键不存在时抛 `JsonException`；1.1.3.1 文档未承诺 `toString()` 的键顺序。 |
| [`JsonString <: JsonValue`](classes/jsonstring/index.md) | 此类为 JsonValue 实现子类，主要用于封装字符串类型的 JSON 数据。 |
| [`sealed abstract JsonValue <: ToString`](classes/jsonvalue/index.md) | JSON 值基类；先用 `kind()` 判别形态，再调用对应 `asXxx()`，形态不匹配时抛 `JsonException`。 |
| [`JsonException <: Exception`](classes/jsonexception/index.md) | JSON 包的异常类，用于 JsonValue 类型使用时出现异常的场景。 |

## 接口

| 声明 | 功能 |
|---|---|
| [`ToJson`](interfaces/tojson/index.md) | 用于实现 JsonValue 和 DataModel 的相互转换。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`JsonKind`](enums/jsonkind/index.md) | `JsonKind` 标识 JsonValue 的七种形态；1.1.3.1 未实现 Equatable，须用 `match` 判别而不能用 `==`/`!=`。 |
