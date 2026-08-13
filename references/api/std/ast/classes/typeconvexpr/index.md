<!-- cj-doc kind="api-type" level="5" id="std.ast.class.typeconvexpr" parent="std.ast" -->
# TypeConvExpr

[← std.ast](../../index.md)

`TypeConvExpr <: Expr`

表示类型转换表达式。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut expr: Expr`](prop-expr.md) | 获取或设置 TypeConvExpr 中进行类型转化的原始表达式。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 TypeConvExpr 中的 "("。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 TypeConvExpr 中的 ")"。 |
| [`mut targetType: PrimitiveType`](prop-targettype.md) | 获取或设置 TypeConvExpr 中将要转换到的目标类型。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 TypeConvExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 TypeConvExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
