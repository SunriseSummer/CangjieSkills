<!-- cj-doc kind="api-type" level="5" id="std.math.enum.roundingmode" parent="std.math" -->
# RoundingMode

[← std.math](../../index.md)

`RoundingMode <: Equatable<RoundingMode> & ToString`

舍入规则枚举类，共包含 6 种舍入规则。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`Ceiling`](value-ceiling.md) | 向正无穷方向舍入。 |
| [`Down`](value-down.md) | 向靠近零的方向舍入。 |
| [`Floor`](value-floor.md) | 向负无穷方向舍入。 |
| [`HalfEven`](value-halfeven.md) | 四舍六入五取偶，又称 “银行家舍入”。 |
| [`HalfUp`](value-halfup.md) | 四舍五入。 |
| [`Up`](value-up.md) | 向远离零的方向舍入。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toString(): String`](tostring.md) | 生成舍入规则名称字符串。 |

## 操作符

| 签名 | 功能 |
|---|---|
| [`operator ==(that: RoundingMode): Bool`](operator-eq.md) | 判等。 |
