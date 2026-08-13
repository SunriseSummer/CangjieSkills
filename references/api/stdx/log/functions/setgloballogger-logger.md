<!-- cj-doc kind="api-member" level="5" id="stdx.log.func.setgloballogger-logger" parent="stdx.log" -->
# setGlobalLogger(Logger)

[← stdx.log](../index.md)

## 签名

```cangjie role=signature
public func setGlobalLogger(logger: Logger): Unit
```

设置全局 Logger 对象。

## 契约

> **注意：**
>
> - 此函数在程序的生命周期中只应该被调用一次。对 setGlobalLogger 的调用完成之前发生的任何日志事件都将被忽略。
> - 此函数通常不需要手动调用。日志实现提供者应提供包含了调用本方法的的初始化方法。

参数：

- logger: Logger - 实现了 Logger 类的对象实例。
