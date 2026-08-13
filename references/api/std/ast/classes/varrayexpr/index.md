<!-- cj-doc kind="api-type" level="5" id="std.ast.class.varrayexpr" parent="std.ast" -->
# VArrayExpr

[← std.ast](../../index.md)

`VArrayExpr <: Expr`

表示 `VArray` 的实例节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut arguments: ArrayList<Argument>`](prop-arguments.md) | 获取或设置 VArrayExpr 中的中的初始化参数序列。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 VArrayExpr 中的 "("。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 VArrayExpr 中的 ")"。 |
| [`mut vArrayType: VArrayType`](prop-varraytype.md) | 获取或设置 VArrayExpr 的 VArray 类型节点。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 VArrayExpr 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 VArrayExpr 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
