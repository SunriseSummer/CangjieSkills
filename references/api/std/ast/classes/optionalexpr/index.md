<!-- cj-doc kind="api-type" level="5" id="std.ast.class.optionalexpr" parent="std.ast" -->
# OptionalExpr

[← std.ast](../../index.md)

`OptionalExpr <: Expr`

表示一个带有问号操作符的表达式节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut baseExpr: Expr`](prop-baseexpr.md) | 获取或设置 OptionalExpr 的表达式节点。 |
| [`mut quest: Token`](prop-quest.md) | 获取或设置 OptionalExpr 中的问号操作符。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 OptionalExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 OptionalExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
