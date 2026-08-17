<!-- cj-doc kind="api-member" level="5" id="std.runtime.func.func-registersignalhandler-signal-signalhandlerfunc" parent="std.runtime" -->
# func registerSignalHandler(Signal, SignalHandlerFunc)

[← std.runtime](../index.md)

## 签名

```cangjie role=signature
public func registerSignalHandler(sig: Signal, handler: SignalHandlerFunc): Unit
```

注册信号的处理函数。同一个信号可以注册多个函数，信号触发时函数按照先进先出策略执行。如果 SignalHandlerFunc 的返回值是 `true` 则停止后续函数的执行，否则继续执行后续函数，直到所有注册的函数执行完。

## 注意
>
- 不支持平台：Windows。
- 仅支持前 31 个可被捕获的非实时信号。
- 暂不支持 SIGBUS、SIGFPE、SIGSEGV 等中断信号。
- handler 暂不支持成员函数和 foreign 函数。

## 参数

- sig: Signal - 目标信号。
- handler: SignalHandlerFunc - 信号处理函数。

## 异常

- IllegalArgumentException - 若信号值超过 31 则抛出异常。

