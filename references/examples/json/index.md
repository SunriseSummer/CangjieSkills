<!-- cj-doc kind="example-category" level="3" id="examples.json" parent="examples" -->
# JSON 与对象序列化

[← 应用示例](../index.md)

按数据形态选择 DOM、流式读写或 Serializable，并对字段类型和数组兼容路径显式处理。

| 示例 | 教学目标 |
|---|---|
| [解析 JSON 并识别输入方言](json-parse.md) | 用 `JsonValue.fromStr` 解析后按形态取值；1.0.5.1 接受非标准整数前缀，严格协议不能把它当合规性校验器。 |
| [校验 JSON 必选字段与类型](json-kind-validation.md) | 缺失字段用 `JsonObject.get` 处理；先以 `match` 判别 `JsonKind`，再调用对应 `asXxx()`。 |
| [按索引遍历 JsonArray](json-array-iteration.md) | JsonArray 在 1.0.5.1 中不是 Iterable；按 0..size() 生成索引后读取元素。 |
| [流式读写对象、Option 与数组](streaming-json-record.md) | 自定义 `JsonSerializable`/`JsonDeserializable` 时显式维护对象状态；Windows cjnative 1.0.5.1 的复合数组按元素读写，避免直接调用泛型数组接口。 |
| [实现自定义 Serializable](serializable.md) | 显式定义 serialize/deserialize，检查 DataModel 实际形态后恢复字段。 |
| [完成嵌套对象的 JSON 往返](json-roundtrip.md) | 自定义 Serializable，把嵌套 DataModel 转为 JSON 后再恢复领域对象。 |
| [安全反序列化对象数组](array-workaround.md) | 序列化需匹配 stdx 版本并检查 `DataModel` 实际类型；Windows cjnative 1.0.5 中避免直接走 `Array<T>` Serializable 运行时路径。 |
