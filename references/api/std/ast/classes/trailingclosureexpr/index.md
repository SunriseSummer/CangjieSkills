<!-- cj-doc kind="api-type" level="5" id="std.ast.class.trailingclosureexpr" parent="std.ast" -->
# TrailingClosureExpr

[← std.ast](../../index.md)

`TrailingClosureExpr <: Expr`

表示尾随 `Lambda` 节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut expr: Expr`](prop-expr.md) | 获取或设置 TrailingClosureExpr 中的表达式。 |
| [`mut lambdaExpr: LambdaExpr`](prop-lambdaexpr.md) | 获取或设置 TrailingClosureExpr 中的尾随 lambda。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 TrailingClosureExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 TrailingClosureExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
