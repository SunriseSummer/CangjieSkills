<!-- cj-doc kind="api-member" level="5" id="std.unittest.testmacro.macro.expect" parent="std.unittest.testmacro" -->
# @Expect

[← std.unittest.testmacro](../index.md)

## 签名

```cangjie role=signature
@Expect
```

`@Expect` 声明 Expect 断言，测试函数内部使用，断言失败继续执行用例。

## 契约

1. `@Expect(leftExpr, rightExpr)` ，比较 `leftExpr` 和 `rightExpr` 是否相同。
2. `@Expect(condition: Bool)` ，比较 `condition` 是否为 `true` ，即 `@Expect(condition: Bool)` 等同于 `@Expect(condition: Bool, true)` 。
3. `@ExpectcustomAssertion`, 使用指定的参数 `arguments` 调用 `customAssertion` 函数。详见 `@CustomAssertion`。
4. `@Expect(leftExpr, rightExpr, delta: deltaExpr)` 使用 delta 参数使能近似相等功能。
5. `@Expect(leftExpr <comparison_operator> rightExpr, delta: deltaExpr)` 使用 delta 参数使能近似相等功能。
