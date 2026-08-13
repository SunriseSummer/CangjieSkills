<!-- cj-doc kind="api-type" level="5" id="std.ast.class.parentype" parent="std.ast" -->
# ParenType

[← std.ast](../../index.md)

`ParenType <: TypeNode`

表示括号类型节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 ParenType 节点中的 "(" 词法单元。 |
| [`mut parenthesizedType: TypeNode`](prop-parenthesizedtype.md) | 获取或设置 ParenType 节点中括起来的类型，如 `(Int64)` 中的 Int64。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 ParenType 节点中的 ")" 词法单元。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 ParenType 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 ParenType 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
