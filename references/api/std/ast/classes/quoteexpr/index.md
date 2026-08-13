<!-- cj-doc kind="api-type" level="5" id="std.ast.class.quoteexpr" parent="std.ast" -->
# QuoteExpr

[← std.ast](../../index.md)

`QuoteExpr <: Expr`

表示 `quote` 表达式节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut exprs: ArrayList<Expr>`](prop-exprs.md) | 获取或设置 QuoteExpr 中由 `()` 括起的内部引用表达式节点。 |
| [`mut keyword: Token`](prop-keyword.md) | 获取或设置 QuoteExpr 的 `quote` 关键字。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 QuoteExpr 中的 "("。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 QuoteExpr 中的 ")"。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 QuoteExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 QuoteExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
