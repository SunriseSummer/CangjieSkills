<!-- cj-doc kind="api-type" level="5" id="std.math.numeric.enum.overflowstrategy" parent="std.math.numeric" -->
# OverflowStrategy

[← std.math.numeric](../../index.md)

`OverflowStrategy <: Equatable<OverflowStrategy> & ToString`

溢出策略枚举类，共包含 3 种溢出策略。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Saturating`](value-saturating.md) | 出现溢出，当前值大于目标类型的 MAX 值，返回目标类型 MAX 值，当前值小于目标类型的 MIN 值，返回目标类型 MIN 值。 |
| [`Throwing`](value-throwing.md) | 出现溢出，抛出异常。 |
| [`Wrapping`](value-wrapping.md) | 出现溢出，高位截断。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toString(): String`](tostring.md) | 生成溢出策略名称字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator ==(that: OverflowStrategy): Bool`](operator-eq.md) | 判等。 |
