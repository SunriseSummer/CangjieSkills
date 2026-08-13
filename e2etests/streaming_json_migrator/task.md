# 流式 JSON 迁移器

## 目标

在仓颉 `1.0.5 (cjnative)` 中实现包 `streaming_json_migrator`。实现必须直接使用 `stdx.encoding.json.stream` 的 `JsonReader`、`JsonWriter`、`JsonSerializable`、`JsonDeserializable`、`JsonToken` 与 `WriteConfig`，以流式方式把旧版用户记录迁移为固定字段顺序的新格式；禁止先解析成 `JsonValue` 或用正则表达式处理 JSON。

将随题提供的 `streaming_json_migrator_test.cj` 原样复制到项目 `src/`，测试不可修改。stdx 固定为与 cjc 1.0.5 匹配的 `1.0.5.1`。

## 公开 API

```cangjie
public class JsonMigrationException <: Exception {
    public init(message: String)
}

public class UserRecord <: JsonSerializable & JsonDeserializable<UserRecord> {
    public let id: Int64
    public let name: String
    public let active: Bool
    public let note: Option<String>
    public let tags: Array<String>

    public init(id: Int64, name: String, active!: Bool = true,
                note!: Option<String> = None,
                tags!: Array<String> = Array<String>())
    public static func fromJson(reader: JsonReader): UserRecord
    public func toJson(writer: JsonWriter): Unit
}

public class JsonRecordMigrator {
    public static func decode(json: String): UserRecord
    public static func encode(record: UserRecord, pretty!: Bool = false,
                              htmlSafe!: Bool = false): String
    public static func migrate(json: String, pretty!: Bool = false,
                               htmlSafe!: Bool = false): String
    public static func extractRawField(json: String, fieldName: String): Option<Array<Byte>>
}
```

## 输入与迁移契约

- 顶层必须是一个 JSON object。
- 新字段为 `id`、`name`、`active`、`note`、`tags`；旧字段别名依次为 `user_id`、`display_name`、`enabled`。
- 同一语义字段同时出现新旧名称或重复出现时，最后出现的值生效。
- `id` 与 `name` 必须出现；`id` 必须非负，`name` 必须非空。缺少或违反约束时抛 `JsonMigrationException`。
- `active` 缺省为 `true`，`note` 缺省为 `None`，`tags` 缺省为空数组。
- 未知字段的值可能是标量、数组或深层 object，必须用 `JsonReader.skip()` 完整消费，不能影响后续已知字段。
- JSON 类型不匹配或语法错误允许保留 `JsonReader` 抛出的标准异常，不得静默纠正。

## 输出契约

- `encode` 与 `migrate` 固定按 `id`、`name`、`active`、`note`、`tags` 顺序写出字段，且只写新字段名。
- `pretty: false` 使用 `WriteConfig.compact`；`pretty: true` 使用 `WriteConfig.pretty`。
- `htmlSafe` 必须传入选定配置的同名属性；紧凑模式下 `htmlSafe: true` 必须转义 `<`、`>`、`&`、`=` 和单引号。
- 写完后调用 `flush()`，返回完整 UTF-8 字符串。
- `extractRawField` 流式扫描顶层 object，命中时用 `readValueBytes()` 返回该值的原始 JSON 字节；未命中返回 `None`。其他字段必须用 `skip()` 消费。

## 工程与入口

`cjpm.toml` 的包名为 `streaming_json_migrator`，输出类型为 `executable`，使用当前 Skill 的 `setup_stdx.py` 配置 stdx。`main()` 迁移固定输入：

```text
{"user_id":7,"display_name":"Ada","enabled":false,"ignored":{"x":[1,2]},"tags":["math","code"]}
```

输出必须为：

```text
{"id":7,"name":"Ada","active":false,"note":null,"tags":["math","code"]}
```

## 验收

```text
cjpm clean
cjpm build
cjpm test
cjpm run
```

四条命令均成功，至少 20 项测试全通过，编译器 warning 为 0，且不可修改冻结测试。
