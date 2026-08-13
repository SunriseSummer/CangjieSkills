<!-- cj-doc kind="api-member" level="6" id="std.core.class.thread.handleuncaughtexceptionby" parent="std.core.class.thread" -->
# Thread.handleUncaughtExceptionBy

[← Thread](index.md)

## 签名

```cangjie role=signature
public static func handleUncaughtExceptionBy(exHandler: (Thread, Exception) -> Unit): Unit
```

注册线程未处理异常的处理函数。

## 契约

当某一线程因异常而提前终止后，如果全局的未处理异常函数被注册，那么将调用该函数并结束线程，在该函数内抛出异常时，将向终端打印提示信息并结束线程，但不会打印异常调用栈信息；如果没有注册全局异常处理函数，那么默认会向终端打印异常调用栈信息。

多次注册处理函数时，后续的注册函数将覆盖之前的处理函数。

当有多个线程同时因异常而终止时，处理函数将被并发执行，因而开发者需要在处理函数中确保并发正确性。

处理函数的参数第一个参数类型为 Thread，是发生异常的线程，第二个参数类型为 Exception，是线程未处理的异常。

参数：

- exHandler: (Thread, Exception) -> Unit - 注册的处理函数。
