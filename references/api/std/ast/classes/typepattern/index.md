<!-- cj-doc kind="api-type" level="5" id="std.ast.class.typepattern" parent="std.ast" -->
# TypePattern

[← std.ast](../../index.md)

`TypePattern <: Pattern`

表示类型模式节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut colon: Token`](prop-colon.md) | 获取或设置 TypePattern 节点中的 ":" 操作符的词法单元节点。 |
| [`mut pattern: Pattern`](prop-pattern.md) | 获取或设置 TypePattern 节点中的模式节点。 |
| [`mut patternType: TypeNode`](prop-patterntype.md) | 获取或设置 TypePattern 节点中的待匹配的模式类型节点。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 TypePattern 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 TypePattern 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
