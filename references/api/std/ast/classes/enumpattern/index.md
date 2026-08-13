<!-- cj-doc kind="api-type" level="5" id="std.ast.class.enumpattern" parent="std.ast" -->
# EnumPattern

[← std.ast](../../index.md)

`EnumPattern <: Pattern`

表示 enum 模式节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut commas: Tokens`](prop-commas.md) | 获取或设置 EnumPattern 节点中的 "," 词法单元序列，可能为空。 |
| [`mut constructor: Expr`](prop-constructor.md) | 获取或设置 EnumPattern 节点中的构造器表达式节点。 |
| [`mut lParen: Token`](prop-lparen.md) | 获取或设置 EnumPattern 节点中的 "(" 的词法单元。 |
| [`mut patterns: ArrayList<Pattern>`](prop-patterns.md) | 获取或设置 EnumPattern 节点中有参构造器内的模式节点列表。 |
| [`mut rParen: Token`](prop-rparen.md) | 获取或设置 EnumPattern 节点中的 ")" 的词法单元。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 EnumPattern 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 EnumPattern 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
