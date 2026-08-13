<!-- cj-doc kind="api-type" level="5" id="std.ast.class.tupletype" parent="std.ast" -->
# TupleType

[← std.ast](../../index.md)

`TupleType <: TypeNode`

表示元组类型节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 TupleType 节点中的 "(" 词法单元。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 TupleType 节点中的 ")" 词法单元。 |
| [`mut types: ArrayList<TypeNode>`](prop-types.md) | 获取或设置 TupleType 节点中的类型节点列表。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 TupleType 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 TupleType 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
