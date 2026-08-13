<!-- cj-doc kind="api-type" level="5" id="stdx.encoding.json.stream.struct.writeconfig" parent="stdx.encoding.json.stream" -->
# WriteConfig

[← stdx.encoding.json.stream](../../index.md)

`WriteConfig`

用于表示 JsonWriter 的序列化格式配置。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`compact: WriteConfig`](field-compact.md) | 提供紧凑的序列化格式。 |
| [`pretty: WriteConfig`](field-pretty.md) | 提供整洁的序列化格式。 |
| [`mut dateTimeFormat: String`](prop-datetimeformat.md) | 用于序列化 DateTime 类型时的格式控制，功能与 `DateTime.toString(String)` 一致。 |
| [`mut htmlSafe: Bool`](prop-htmlsafe.md) | 用于表示是否转义 HTML 字符 `<`、`>`、`&`、`=`和`'`。 |
| [`mut indent: String`](prop-indent.md) | 用于表示序列化时每个缩进级别填入的缩进字符串。 |
| [`mut newline: String`](prop-newline.md) | 用于表示序列化时填入的换行符。 |
| [`mut useSpaceAfterSeparators: Bool`](prop-usespaceafterseparators.md) | 用于表示序列化时在 ':' 和 ',' 后是否加一个空格。 |
