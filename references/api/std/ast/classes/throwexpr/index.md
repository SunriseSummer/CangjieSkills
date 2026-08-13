<!-- cj-doc kind="api-type" level="5" id="std.ast.class.throwexpr" parent="std.ast" -->
# ThrowExpr

[← std.ast](../../index.md)

`ThrowExpr <: Expr`

表示 `throw` 表达式节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut expr: Expr`](prop-expr.md) | 获取或设置 ThrowExpr 节点中的表达式节点。 |
| [`mut keyword: Token`](prop-keyword.md) | 获取或设置 ThrowExpr 节点中的关键字。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 ThrowExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 ThrowExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
