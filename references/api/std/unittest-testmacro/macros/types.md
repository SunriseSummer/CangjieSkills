<!-- cj-doc kind="api-member" level="5" id="std.unittest.testmacro.macro.types" parent="std.unittest.testmacro" -->
# @Types

[← std.unittest.testmacro](../index.md)

## 签名

```cangjie role=signature
@Types
```

`@Types` 宏为测试类或测试函数提供类型参数。

## 契约

功能：`@Types` 宏为测试类或测试函数提供类型参数。它可以放置在测试类或测试函数上。

语法规则为 `@Types[Id1 in <Type1, Type2, Type3>, Id2 in <Type4, Type5> ...]`
其中 `Id1`、`Id2`... 是有效类型参数标识符，`Type1`、`Type2`、`Type3`... 是有效的仓颉类型。

`@Types` 宏有以下限制：

- 必须与 `@Test`， `@TestCase` 或 `@Bench` 宏共同使用。
- 一个声明只能有一个 `@Types` 宏修饰。
- 该声明必须是具有与 `@Types` 宏中列出的相同类型参数的泛型类或函数。
- 类型列表中列出的类型不能相互依赖，例如 `@Types[A in <Int64, String>, B in <List<A>>]` 将无法正确编译。但是，在为该类内的测试函数提供类型时，可以使用为测试类提供的类型。例如：

该机制可以与其他测试框架功能一起使用，例如 `@Configure` 等。
