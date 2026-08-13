<!-- cj-doc kind="api-type" level="5" id="std.regex.struct.matchdata" parent="std.regex" -->
# MatchData

[← std.regex](../../index.md)

`MatchData`

存储正则表达式匹配结果，并提供对正则匹配结果进行查询的函数。

## 方法

| 签名 | 功能 |
|---|---|
| [`groupCount(): Int64`](groupcount.md) | 获取捕获组的个数。 |
| [`matchPosition(): Position`](matchposition.md) | 获取上一次匹配到的子字符串在输入字符串中起始位置和末尾位置的索引。 |
| [`matchPosition(group: Int64): Position`](matchposition.md) | 根据给定的索引获取上一次匹配中该捕获组匹配到的子字符串在输入字符串中的位置信息。 |
| [`matchPosition(group: String): Position`](matchposition.md) | 根据给定的命名捕获组名称取上一次匹配中该捕获组匹配到的子字符串在输入字符串中的位置信息。 |
| [`matchString(): String`](matchstring.md) | 获取上一次匹配到的子字符串，结果与调用 matchString(0) 相同。 |
| [`matchString(group: Int64): String`](matchstring.md) | 根据给定的索引获取上一次匹配中该捕获组匹配到的子字符串。 |
| [`matchString(group: String): String`](matchstring.md) | 根据给定的命名捕获组名称获取上一次匹配中该捕获组匹配到的子字符串。 |
