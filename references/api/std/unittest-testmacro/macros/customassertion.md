<!-- cj-doc kind="api-member" level="5" id="std.unittest.testmacro.macro.customassertion" parent="std.unittest.testmacro" -->
# @CustomAssertion

[← std.unittest.testmacro](../index.md)

## 签名

```cangjie role=signature
@CustomAssertion
```

`@CustomAssertions` 将函数指定为用户自定义断言。

## 契约

该宏修饰的函数应满足两个要求：

1. 顶层函数
2. 首个入参为 `AssertionCtx` 类型。
