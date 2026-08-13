<!-- cj-doc kind="api-type" level="5" id="std.regex.class.regex" parent="std.regex" -->
# Regex

[← std.regex](../../index.md)

`Regex`

用来指定编译类型并创建正则表达式实例。

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(pattern: String, flags: Array<RegexFlag>)`](init.md) | 创建 Regex 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`find(input: String, group!: Bool = false): Option<MatchData>`](find.md) | 查找第一个匹配到的子序列。 |
| [`findAll(input: String, group!: Bool = false): Array<MatchData>`](findall.md) | 对整个输入序列进行匹配，查找所有匹配到的子序列。 |
| [`getNamedGroups(): Map<String, Int64>`](getnamedgroups.md) | 获取命名捕获组的名称与索引映射。 |
| [`lazyFindAll(input: String, group!: Bool = false): Iterator<MatchData>`](lazyfindall.md) | 对整个输入序列进行匹配，获取匹配的迭代器。 |
| [`matches(input: String): Bool`](matches.md) | 判断入参 input 与正则表达式是否存在匹配。 |
| [`replace(input: String, replacement: String): String`](replace.md) | 自当前字符串起始位置开始，匹配到的第一个子序列替换为目标字符串。 |
| [`replace(input: String, replacement: String, index: Int64): String`](replace.md) | 从输入序列的 index 位置起匹配正则，将匹配到的第一个子序列替换为目标字符串。 |
| [`replaceAll(input: String, replacement: String): String`](replaceall.md) | 将输入序列中所有与正则匹配的子序列替换为给定的目标字符串。 |
| [`replaceAll(input: String, replacement: String, limit: Int64): String`](replaceall.md) | 将输入序列中与正则匹配的前 limit 个子序列替换为给定的替换字符串。 |
| [`split(input: String): Array<String>`](split.md) | 将给定的输入序列根据正则尽可能的分割成多个子序列。 |
| [`split(input: String, limit: Int64): Array<String>`](split.md) | 将给定的输入序列根据正则尽可能的分割成多个子序列 （最多分割成 limit 个子串）。 |
| [`string(): String`](string.md) | 获取正则的输入序列。 |
