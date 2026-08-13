<!-- cj-doc kind="api-type" level="5" id="std.ast.class.matchexpr" parent="std.ast" -->
# MatchExpr

[← std.ast](../../index.md)

`MatchExpr <: Expr`

表示模式匹配表达式实现模式匹配。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut keyword: Token`](prop-keyword.md) | 获取或设置 MatchExpr 节点中 `match` 关键字。 |
| [`mut lBrace: Token`](prop-lbrace.md) | 获取或设置 MatchExpr 之后的 "{"。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 MatchExpr 之后的 "("。 |
| [`mut matchCases: ArrayList<MatchCase>`](prop-matchcases.md) | 获取或设置 MatchExpr 内的 `matchCase`, `matchCase` 以关键字 `case` 开头，后跟一个或者多个由 Pattern 或 Expr节点，具体见 MatchCase。 |
| [`mut rBrace: Token`](prop-rbrace.md) | 获取或设置 MatchExpr 之后的 "}"。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 MatchExpr 之后的 ")"。 |
| [`mut selector: Expr`](prop-selector.md) | 获取或设置关键字 `match` 之后的 Expr。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 MatchExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 MatchExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
