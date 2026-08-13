<!-- cj-doc kind="api-package" level="4" id="std.argopt" parent="api.std" -->
# std.argopt

[← std 包索引](../index.md)

提供从命令行参数字符串解析出参数名和参数值的相关能力。

包路径：`std.argopt`。在代码中只导入实际使用的类型或函数。

## 类

| 声明 | 功能 |
|---|---|
| [`ArgumentParseException <: Exception`](classes/argumentparseexception/index.md) | 参数解析异常类。 |

## 结构体

| 声明 | 功能 |
|---|---|
| [`ParsedArguments`](structs/parsedarguments/index.md) | 存储参数解析的结果。 |

## 枚举

| 声明 | 功能 |
|---|---|
| [`ArgumentMode <: ToString & Equatable<ArgumentMode>`](enums/argumentmode/index.md) | 描述选项的参数模式。 |
| [`ArgumentSpec`](enums/argumentspec/index.md) | 描述参数的规范。 |

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`parseArguments(args: Array<String>, specs: Array<ArgumentSpec>): ParsedArguments`](functions/parsearguments-array-string-array-argumentspec.md) | 根据提供的参数规范 `specs` 解析命令行参数 `args`，返回一个结构化的对象，包含解析后的选项和非选项参数。 |
