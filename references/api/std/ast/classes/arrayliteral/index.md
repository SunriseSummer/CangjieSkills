<!-- cj-doc kind="api-type" level="5" id="std.ast.class.arrayliteral" parent="std.ast" -->
# ArrayLiteral

[← std.ast](../../index.md)

`ArrayLiteral <: Expr`

表示 Array 字面量节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut elements: ArrayList<Expr>`](prop-elements.md) | 获取或设置 ArrayLiteral 中的表达式列表。 |
| [`mut lSquare: Token`](prop-lsquare.md) | 获取或设置 ArrayLiteral 中的 "["。 |
| [`mut rSquare: Token`](prop-rsquare.md) | 获取或设置 ArrayLiteral 中的 "]"。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 ArrayLiteral 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 ArrayLiteral 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
