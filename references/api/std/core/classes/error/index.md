<!-- cj-doc kind="api-type" level="5" id="std.core.class.error" parent="std.core" -->
# Error

[← std.core](../../index.md)

`open Error <: ToString`

Error 是所有错误类的基类。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`open message: String`](prop-message.md) | 获取错误信息。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`getStackTrace(): Array<StackTraceElement>`](getstacktrace.md) | 获取堆栈信息，每一条堆栈信息用一个 StackTraceElement 实例表示，最终返回一个 StackTraceElement 的数组。 |
| [`open getStackTraceMessage(): String`](getstacktracemessage.md) | 获取堆栈信息。 |
| [`open printStackTrace(): Unit`](printstacktrace.md) | 向控制台打印堆栈信息。 |
| [`open toString(): String`](tostring.md) | 获取当前 Error 实例的字符串值，包括类名和错误信息。 |
