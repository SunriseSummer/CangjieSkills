<!-- cj-doc kind="api-type" level="5" id="std.ast.class.rangeexpr" parent="std.ast" -->
# RangeExpr

[← std.ast](../../index.md)

`RangeExpr <: Expr`

表示包含区间操作符的表达式。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut colon: Token`](prop-colon.md) | 获取或设置 RangeExpr 中的 ":" 操作符。 |
| [`mut end: Expr`](prop-end.md) | 获取或设置 RangeExpr 中的终止值。 |
| [`mut op: Token`](prop-op.md) | 获取或设置 RangeExpr 中的 Range 的操作符。 |
| [`mut start: Expr`](prop-start.md) | 获取或设置 RangeExpr 中的起始值。 |
| [`mut step: Expr`](prop-step.md) | 获取或设置 RangeExpr 中序列中前后两个元素之间的差值。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 RangeExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 RangeExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
