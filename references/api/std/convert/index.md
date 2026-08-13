<!-- cj-doc kind="api-package" level="4" id="std.convert" parent="api.std" -->
# std.convert

[← std 包索引](../index.md)

提供从字符串转到特定类型的 Convert 系列函数。

包路径：`std.convert`。在代码中只导入实际使用的类型或函数。

## 接口

| 声明 | 功能 |
|---|---|
| [`Formattable`](interfaces/formattable/index.md) | `format(fmt)` 使用 `[flags][width][.precision][specifier]` 格式化整数、浮点数和 Rune；`-` 左对齐，宽度默认右对齐，`.precision` 控制整数补零或浮点小数位。 |
| [`Parsable<T>`](interfaces/parsable/index.md) | 本接口提供了统一的方法，以支持将字符串解析为特定类型。 |
| [`RadixConvertible<T>`](interfaces/radixconvertible/index.md) | 本接口提供了统一的方法，以支持将指定进制的字符串解析为特定类型。 |
