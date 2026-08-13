<!-- cj-doc kind="api-type" level="5" id="std.ast.class.primitivetype" parent="std.ast" -->
# PrimitiveType

[← std.ast](../../index.md)

`PrimitiveType <: TypeNode`

表示一个基本类型节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut keyword: Token`](prop-keyword.md) | 获取或设置构造 PrimitiveType 类型的关键字，如 Int8。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 PrimitiveType 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 PrimitiveType 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
