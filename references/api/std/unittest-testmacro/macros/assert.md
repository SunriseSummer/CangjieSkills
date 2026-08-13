<!-- cj-doc kind="api-member" level="5" id="std.unittest.testmacro.macro.assert" parent="std.unittest.testmacro" -->
# @Assert

[← std.unittest.testmacro](../index.md)

## 签名

```cangjie role=signature
@Assert
```

`@Assert` 声明 Assert 断言，测试函数内部使用，断言失败停止用例。

## 契约

1. `@Assert(leftExpr, rightExpr)` ，比较 `leftExpr` 和 `rightExpr` 值是否相同。
2. `@Assert(condition: Bool)` ，比较 `condition` 是否为 `true` ，即 `@Assert(condition: Bool)` 等同于 `@Assert(condition: Bool, true)` 。
3. `@AssertcustomAssertion`, 使用指定的参数 `arguments` 调用 `customAssertion` 函数，详见 `@CustomAssertion`。
4. `@Assert(leftExpr, rightExpr, delta: deltaExpr)` 使用 delta 参数使能近似相等功能。
5. `@Assert(leftExpr <comparison_operator> rightExpr, delta: deltaExpr)` 使用 delta 参数使能近似相等功能。
