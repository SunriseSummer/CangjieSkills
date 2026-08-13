<!-- cj-doc kind="api-member" level="5" id="std.unittest.testmacro.macro.strategy" parent="std.unittest.testmacro" -->
# @Strategy

[← std.unittest.testmacro](../index.md)

## 签名

```cangjie role=signature
@Strategy
```

在函数上使用 `@Strategy` 可从该函数创建新的 DataStrategy 。

## 契约

功能：在函数上使用 `@Strategy` 可从该函数创建新的 DataStrategy 。它是一个用于组合、映射和重用策略的便捷 API。

标记为 `@Strategy` 的函数必须满足以下条件：

1. 必须显式指定返回类型。
2. 参数必须与宏参数中指定的 DSL 相对应。
3. 可以在 `@Test` 标记的类的外部和内部使用。

> 实现说明：宏展开的结果是一个具有函数名称和 DataStrategyProcessor 类型的变量。 该变量可以在任何可以使用  DataStrategy 的地方使用。
