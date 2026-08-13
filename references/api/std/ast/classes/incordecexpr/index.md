<!-- cj-doc kind="api-type" level="5" id="std.ast.class.incordecexpr" parent="std.ast" -->
# IncOrDecExpr

[← std.ast](../../index.md)

`IncOrDecExpr <: Expr`

表示包含自增操作符（`++`）或自减操作符（`--`）的表达式。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut expr: Expr`](prop-expr.md) | 获取或设置 IncOrDecExpr 中的表达式。 |
| [`mut op: Token`](prop-op.md) | 获取或设置 IncOrDecExpr 中的操作符。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 IncOrDecExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 IncOrDecExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
