<!-- cj-doc kind="api-type" level="5" id="std.regex.enum.regexflag" parent="std.regex" -->
# RegexFlag

[← std.regex](../../index.md)

`RegexFlag`

正则模式标志；处理非 ASCII 模式、输入或捕获组时显式使用 `RegexFlag.Unicode`，仓颉 1.1.3 未启用时捕获组边界可能产生无效 UTF-8。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`IgnoreCase`](value-ignorecase.md) | 指定匹配模式为忽略大小写。 |
| [`MultiLine`](value-multiline.md) | 指定匹配模式为多行文本模式。 |
| [`Unicode`](value-unicode.md) | 指定匹配模式支持 Unicode。 |
