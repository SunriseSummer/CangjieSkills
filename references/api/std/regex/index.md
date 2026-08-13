<!-- cj-doc kind="api-package" level="4" id="std.regex" parent="api.std" -->
# std.regex

[← std 包索引](../index.md)

使用正则表达式查找、验证、替换和分割文本。

包路径：`std.regex`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`Regex`](classes/regex/index.md) | 用来指定编译类型并创建正则表达式实例。 |
| [`RegexException <: Exception`](classes/regexexception/index.md) | 提供正则的异常处理。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`MatchData`](structs/matchdata/index.md) | 存储正则表达式匹配结果，并提供对正则匹配结果进行查询的函数。 |
| [`Position`](structs/position/index.md) | 用来存储位置信息，表示的是一个前闭后开区间。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`RegexFlag`](enums/regexflag/index.md) | 正则模式标志；处理非 ASCII 模式、输入或捕获组时显式使用 `RegexFlag.Unicode`，仓颉 1.0.5 未启用时捕获组边界可能产生无效 UTF-8。 |
