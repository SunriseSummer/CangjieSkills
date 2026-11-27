<!-- cj-doc kind="api-member" level="5" id="std.env.func.atexit-unit" parent="std.env" -->
# atExit(() -> Unit)

[← std.env](../index.md)

## 签名

```cangjie role=signature
public func atExit(callback: () -> Unit): Unit
```

注册回调函数，当前进程退出时执行注册函数。

## 契约

> **注意：**
>
> 请不要使用 C 语言 atexit 函数，避免出现非预期问题。

参数：

- callback: () ->Unit - 需要被注册回调的函数。
