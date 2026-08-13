<!-- cj-doc kind="api-type" level="5" id="std.ast.class.primitivetypeexpr" parent="std.ast" -->
# PrimitiveTypeExpr

[← std.ast](../../index.md)

`PrimitiveTypeExpr <: Expr`

表示基本类型表达式节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut keyword: Token`](prop-keyword.md) | 获取或设置 PrimitiveTypeExpr 中的基本类型关键字。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 PrimitiveTypeExpr 对象。 |
| [`init(kind: Tokens)`](init.md) | 构造一个 PrimitiveTypeExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
