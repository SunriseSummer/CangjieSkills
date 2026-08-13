<!-- cj-doc kind="api-member" level="5" id="std.unittest.testmacro.macro.skip" parent="std.unittest.testmacro" -->
# @Skip

[← std.unittest.testmacro](../index.md)

## 签名

```cangjie role=signature
@Skip
```

`@Skip` 修饰已经被 `@TestCase` / `@Bench` 修饰的函数，使该测试用例被跳过。

## 契约

语法规则为 `@Skip[expr]` 。

1. `expr` 暂只支持 `true` ，表达式为 `true` 时，跳过该测试，其他均为 `false` 。
2. 默认 `expr` 为 `true` 即 `@Skip[true]` == `@Skip` 。
