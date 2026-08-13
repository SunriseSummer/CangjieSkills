<!-- cj-doc kind="api-member" level="5" id="std.ast.func.insideparentcontext-string" parent="std.ast" -->
# insideParentContext(String)

[← std.ast](../index.md)

## 签名

```cangjie role=signature
public func insideParentContext(parentMacroName: String): Bool
```

检查当前宏调用是否在特定的宏调用内，返回一个布尔值。

## 契约

> **注意：**
>
> - 在嵌套宏场景下，内层宏也可以通过发送键/值对的方式与外层宏通信。当内层宏执行时，通过调用标准库函数 setItem 向外层宏发送信息；随后，当外层宏执行时，调用标准库函数 getChildMessages 接收每一个内层宏发送的信息（一组键/值对映射）。
> - 该函数只能作为函数被直接调用，不能作为赋值给变量，不能作为实参或返回值使用。

参数：

- parentMacroName: String - 待检查的外层宏调用的名字。

返回值：

- Bool - 若当前宏嵌套在特定的宏调用内，返回 true。
