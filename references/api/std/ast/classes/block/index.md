<!-- cj-doc kind="api-type" level="5" id="std.ast.class.block" parent="std.ast" -->
# Block

[← std.ast](../../index.md)

`Block <: Expr`

表示块节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut lBrace: Token`](prop-lbrace.md) | 获取或设置 Block 的 "{"。 |
| [`mut nodes: ArrayList<Node>`](prop-nodes.md) | 获取或设置 Block 中的表达式或声明序列。 |
| [`mut rBrace: Token`](prop-rbrace.md) | 获取或设置 Block 的 "}"。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 Block 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
