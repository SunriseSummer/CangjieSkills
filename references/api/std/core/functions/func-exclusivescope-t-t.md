<!-- cj-doc kind="api-member" level="5" id="std.core.func.func-exclusivescope-t-t" parent="std.core" -->
# func exclusiveScope<T>(( ) -> T)

[← std.core](../index.md)

## 签名

```cangjie role=signature
public func exclusiveScope<T>(fn: () -> T): T
```

在独占作用域中执行一个闭包，确保闭包在隔离的上下文中运行，并适当地处理任何结果或异常。当执行 fn 时，会发生从仓颉线程栈到操作系统线程栈的切换，并且底层操作系统线程不能被其他仓颉线程抢占。在 fn 返回后，它将切换回仓颉线程栈，并允许进行抢占。

## 注意
>
不支持平台：Windows、macOS、OpenHarmony、HarmonyOS、iOS。

## 参数

- fn: () -> T - 在独占作用域中执行的函数/闭包。

## 返回值

- T - 函数执行的结果。

## 异常

- ExclusiveScopeException - 如果在执行过程中发生异常。

