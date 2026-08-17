<!-- cj-doc kind="api-member" level="6" id="std.core.class.thread.handleuncaughterrorby" parent="std.core.class.thread" -->
# Thread.handleUncaughtErrorBy

[← Thread](index.md)

## 签名

```cangjie role=signature
public static func handleUncaughtErrorBy(erHandler: (Error) -> Unit): Unit
```

注册线程未处理错误的处理函数。

当某一线程因错误而提前终止后：

- 如果全局的未处理错误函数被注册，那么将调用该函数并结束线程，在该函数内抛出异常或错误时，将向终端打印简单的提示信息，同时结束线程（如果处理函数内抛出的是异常）或结束进程（如果处理函数内抛出的是错误）。
- 如果没有注册全局错误处理函数，那么默认会向终端打印错误信息。

多次注册处理函数时，后续的注册函数将覆盖之前的处理函数。

当有多个线程同时因异常而终止时，处理函数将被并发执行，因而开发者需要在处理函数中确保并发正确性。

处理函数的参数类型为 Error，是线程未处理的错误。

## 注意
>
不支持平台：OpenHarmony。

## 参数

- erHandler: (Error) -> Unit - 注册的处理函数。

