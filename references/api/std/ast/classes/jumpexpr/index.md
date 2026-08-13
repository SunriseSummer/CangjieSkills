<!-- cj-doc kind="api-type" level="5" id="std.ast.class.jumpexpr" parent="std.ast" -->
# JumpExpr

[← std.ast](../../index.md)

`JumpExpr <: Expr`

表示循环表达式的循环体中的 `break` 和 `continue`。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut keyword: Token`](prop-keyword.md) | 获取或设置关键字。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 JumpExpr 对象。 |
| [`init(kind: Tokens)`](init.md) | 构造一个 JumpExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
