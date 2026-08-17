<!-- cj-doc kind="api-member" level="5" id="std.runtime.type.type-signalhandlerfunc-int32-bool" parent="std.runtime" -->
# type SignalHandlerFunc = (Int32) -> Bool

[← std.runtime](../index.md)

## 签名

```cangjie role=signature
public type SignalHandlerFunc = (Int32) -> Bool
```

定义一个信号处理函数 (Int32) -> Bool，在注册信号回调函数时，可以同一个信号注册多个回调函数组成函数处理链。函数返回值是 `true` 则停止后续函数的执行，否则继续执行后续函数，直到所有注册的函数执行完。如果该信号的处理的最后一个函数返回值是 `false` 则会继续执行该信号的默认行为，否则不会执行该信号的默认行为。

## 注意
>
不支持平台：Windows。

