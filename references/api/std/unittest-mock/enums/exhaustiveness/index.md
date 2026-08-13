<!-- cj-doc kind="api-type" level="5" id="std.unittest.mock.enum.exhaustiveness" parent="std.unittest.mock" -->
# Exhaustiveness

[← std.unittest.mock](../../index.md)

`Exhaustiveness`

此枚举类型用于指定 `unordered` 函数的验证模式，包含两种模式。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Exhaustive`](value-exhaustive.md) | 要求在验证范围内的每一次“桩签名”的调用均需在验证动作中被定义。 |
| [`Partial`](value-partial.md) | 允许验证范围内存在未在验证动作中被定义的“桩签名”的调用行为。 |
