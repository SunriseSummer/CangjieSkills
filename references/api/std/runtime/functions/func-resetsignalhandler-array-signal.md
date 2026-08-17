<!-- cj-doc kind="api-member" level="5" id="std.runtime.func.func-resetsignalhandler-array-signal" parent="std.runtime" -->
# func resetSignalHandler(Array<Signal>)

[← std.runtime](../index.md)

## 签名

```cangjie role=signature
public func resetSignalHandler(sigs: Array<Signal>): Unit
```

清空注册的信号处理函数，如果输入信号为空，则清空所有信号的注册函数。

## 注意
>
- 不支持平台：Windows。
- 仅支持前 31 个可被捕获的非实时信号。
- 暂不支持 SIGBUS、SIGFPE、SIGSEGV 等中断信号。

## 参数

- sigs: Array<Signal> - 需要被重置的信号列表。

## 异常

- IllegalArgumentException - 若信号值超过 31 则抛出异常。

