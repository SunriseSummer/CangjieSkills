<!-- cj-doc kind="api-type" level="5" id="std.ast.class.parenexpr" parent="std.ast" -->
# ParenExpr

[← std.ast](../../index.md)

`ParenExpr <: Expr`

表示一个括号表达式节点，是指使用圆括号括起来的表达式。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 ParenExpr 节点中的 "("。 |
| [`mut parenthesizedExpr: Expr`](prop-parenthesizedexpr.md) | 获取或设置 ParenExpr 节点中由圆括号括起来的子表达式。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 ParenExpr 节点中的 ")"。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 ParenExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 ParenExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
