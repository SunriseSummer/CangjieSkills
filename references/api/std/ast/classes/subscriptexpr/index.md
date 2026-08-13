<!-- cj-doc kind="api-type" level="5" id="std.ast.class.subscriptexpr" parent="std.ast" -->
# SubscriptExpr

[← std.ast](../../index.md)

`SubscriptExpr <: Expr`

表示索引访问表达式。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut baseExpr: Expr`](prop-baseexpr.md) | 获取或设置 SubscriptExpr 中的表达式。 |
| [`mut indexList: ArrayList<Expr>`](prop-indexlist.md) | 获取或设置 SubscriptExpr 中的索引表达式序列。 |
| [`mut lSquare: Token`](prop-lsquare.md) | 获取或设置 SubscriptExpr 中的 "["。 |
| [`mut rSquare: Token`](prop-rsquare.md) | 获取或设置 SubscriptExpr 中的 "]"。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 SubscriptExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 SubscriptExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
