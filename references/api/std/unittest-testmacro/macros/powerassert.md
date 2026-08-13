<!-- cj-doc kind="api-member" level="5" id="std.unittest.testmacro.macro.powerassert" parent="std.unittest.testmacro" -->
# @PowerAssert

[← std.unittest.testmacro](../index.md)

## 签名

```cangjie role=signature
@PowerAssert
```

1. `@PowerAssert(leftExpr, rightExpr)` ，比较 `leftExpr` 和 `rightExpr` 值是否相同。

## 契约

1. `@PowerAssert(leftExpr, rightExpr)` ，比较 `leftExpr` 和 `rightExpr` 值是否相同。
2. `@PowerAssert(condition: Bool)` ，比较 `condition` 是否为 `true` ，即 `@PowerAssert(condition: Bool)` 等同于 `@PowerAssert(condition: Bool, true)` 。
3. `@PowerAssert(leftExpr, rightExpr, delta: deltaExpr)` 使用 delta 参数使能近似相等功能。
4. `@PowerAssert(leftExpr <comparison_operator> rightExpr, delta: deltaExpr)` 使用 delta 参数使能近似相等功能。

`@PowerAssert` 宏对比 `@Assert` ，可显示表达式各个可被计算的子表达式的值的详细图表，包括步骤中的异常。

其打印的详细信息如下：

```text
Assert Failed: `(foo(10, y: "test" + s) == foo(s.size, y: s) + bar(a))`
                |          |        |_||  |   |_|    |   |_|| |   |_||
                |          |       "123"  |  "123"   |  "123" |    1 |
                |          |__________||  |   |______|      | |______|
                |            "test123" |  |       3         |    33  |
                |______________________|  |_________________|        |
                            0             |        1                 |
                                          |__________________________|
                                                        34
--------------------------------------------------------------------------------------------------
```

请注意，返回的 Tokens 是初始表达式，但包装到一些内部包装器中，这些包装器允许进一步打印中间值和异常。
