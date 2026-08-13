<!-- cj-doc kind="api-member" level="5" id="std.ast.func.assertparentcontext-string" parent="std.ast" -->
# assertParentContext(String)

[← std.ast](../index.md)

## 签名

```cangjie role=signature
public func assertParentContext(parentMacroName: String): Unit
```

检查当前宏调用是否在特定的宏调用内。

## 契约

功能：检查当前宏调用是否在特定的宏调用内。若检查不符合预期，编译器出现一个错误提示。

> **注意：**
>
> 该函数只能作为函数被直接调用，不能作为赋值给变量，不能作为实参或返回值使用。

参数：

- parentMacroName: String - 待检查的外层宏调用的名字。
