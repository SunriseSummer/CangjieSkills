<!-- cj-doc kind="api-type" level="5" id="std.argopt.enum.argumentspec" parent="std.argopt" -->
# ArgumentSpec

[← std.argopt](../../index.md)

`ArgumentSpec`

描述参数的规范。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Full(String, Rune, ArgumentMode)`](value-full-string-rune-argumentmode.md) | 表示同时存在长选项和短选项。 |
| [`Full(String, Rune, ArgumentMode, (String) -> Unit)`](value-full-string-rune-argumentmode-string-unit.md) | 表示同时存在长选项和短选项，并持有一个 `lambda` 回调函数。 |
| [`Long(String, ArgumentMode)`](value-long-string-argumentmode.md) | 表示是一个长选项规格。 |
| [`Long(String, ArgumentMode, (String) -> Unit)`](value-long-string-argumentmode-string-unit.md) | 表示是一个长选项，同时持有一个 `lambda` 回调函数。 |
| [`NonOptions((Array<String>) -> Unit)`](value-nonoptions-array-string-unit.md) | 表示是一个非选项。 |
| [`Short(Rune, ArgumentMode)`](value-short-rune-argumentmode.md) | 表示是一个短选项。 |
| [`Short(Rune, ArgumentMode, (String) -> Unit)`](value-short-rune-argumentmode-string-unit.md) | 表示是一个短选项，同时持有一个 `lambda` 回调函数。 |
