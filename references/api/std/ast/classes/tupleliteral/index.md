<!-- cj-doc kind="api-type" level="5" id="std.ast.class.tupleliteral" parent="std.ast" -->
# TupleLiteral

[← std.ast](../../index.md)

`TupleLiteral <: Expr`

表示元组字面量节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut elements: ArrayList<Expr>`](prop-elements.md) | 获取或设置 TupleLiteral 中的表达式列表。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 TupleLiteral 中的 "("。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 TupleLiteral 中的 ")"。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 TupleLiteral 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 TupleLiteral 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
