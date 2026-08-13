<!-- cj-doc kind="api-type" level="5" id="std.ast.class.unaryexpr" parent="std.ast" -->
# UnaryExpr

[← std.ast](../../index.md)

`UnaryExpr <: Expr`

表示一个一元操作表达式节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut expr: Expr`](prop-expr.md) | 获取或设置 UnaryExpr 节点中的操作数。 |
| [`mut op: Token`](prop-op.md) | 获取或设置 UnaryExpr 节点中的一元操作符。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 UnaryExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 UnaryExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
