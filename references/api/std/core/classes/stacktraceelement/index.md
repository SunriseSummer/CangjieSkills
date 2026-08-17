<!-- cj-doc kind="api-type" level="5" id="std.core.class.stacktraceelement" parent="std.core" -->
# StackTraceElement

[← std.core](../../index.md)

`open StackTraceElement`

表示一个异常堆栈的具体信息，包括异常发生的类名、函数名、文件名、行号。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`declaringClass: String`](field-declaringclass.md) | 获取异常发生的类名。 |
| [`fileName: String`](field-filename.md) | 获取异常发生的文件名。 |
| [`lineNumber: Int64`](field-linenumber.md) | 获取异常发生的行号。 |
| [`methodName: String`](field-methodname.md) | 获取异常发生的函数名。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init(declaringClass: String, methodName: String, fileName: String, lineNumber: Int64)`](init.md) | 构造一个异常堆栈实例，指定类名、函数名、文件名、行号。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`func toString(): String`](tostring.md) | 获取 StackTraceElement 对象的字符串表示。 |
