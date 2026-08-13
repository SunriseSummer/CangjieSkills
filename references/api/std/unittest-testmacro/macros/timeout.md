<!-- cj-doc kind="api-member" level="5" id="std.unittest.testmacro.macro.timeout" parent="std.unittest.testmacro" -->
# @Timeout

[← std.unittest.testmacro](../index.md)

## 签名

```cangjie role=signature
@Timeout
```

`@Timeout` 指示测试应在指定时间后终止。

## 契约

功能：`@Timeout` 指示测试应在指定时间后终止。它有助于测试可能运行很长时间或陷入无限循环的复杂算法。

语法规则为 `@Timeout[expr]`

 `expr` 的类型应为 std.time.Duration 。
其修饰测试类时为每个相应的测试用例提供超时时间。
