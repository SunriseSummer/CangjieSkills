<!-- cj-doc kind="api-member" level="5" id="std.runtime.func.func-unregistersignalhandler-signal-signalhandlerfunc" parent="std.runtime" -->
# func unregisterSignalHandler(Signal, SignalHandlerFunc)

[← std.runtime](../index.md)

## 签名

```cangjie role=signature
public func unregisterSignalHandler(sig: Signal, handler: SignalHandlerFunc): Unit
```

取消注册信号的处理函数。

## 注意
>
- 不支持平台：Windows。
- 仅支持前 31 个可被捕获的非实时信号。
- 暂不支持 SIGBUS、SIGFPE、SIGSEGV 等中断信号。
- handler 暂不支持成员函数和 foreign 函数。

## 参数

- sig: Signal - 需要取消注册的信号。
- handler: SignalHandlerFunc - 需要取消注册的信号处理函数。

## 异常

- IllegalArgumentException - 若信号值超过 31 则抛出异常。

