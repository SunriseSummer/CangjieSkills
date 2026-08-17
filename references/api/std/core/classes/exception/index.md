<!-- cj-doc kind="api-type" level="5" id="std.core.class.exception" parent="std.core" -->
# Exception

[← std.core](../../index.md)

`open Exception <: ToString`

Exception 是所有异常类的父类。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`open message: String`](prop-message.md) | 获取异常信息。 |
| [`mut prop causedBy: ?Exception`](prop-causedby.md) | 异常的触发原因。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 Exception 实例，默认异常信息为空。 |
| [`init(message: String)`](init.md) | 根据异常信息构造一个 Exception 实例。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`getStackTrace(): Array<StackTraceElement>`](getstacktrace.md) | 获取堆栈信息，每一条堆栈信息用一个 StackTraceElement 实例表示，最终返回一个 StackTraceElement 的数组。 |
| [`printStackTrace(): Unit`](printstacktrace.md) | 向控制台打印堆栈信息。 |
| [`open toString(): String`](tostring.md) | 获取当前 Exception 实例的字符串值，包括类名和异常信息。 |
