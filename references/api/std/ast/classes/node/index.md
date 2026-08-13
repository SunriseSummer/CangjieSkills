<!-- cj-doc kind="api-type" level="5" id="std.ast.class.node" parent="std.ast" -->
# Node

[← std.ast](../../index.md)

`abstract sealed Node <: ToTokens`

所有仓颉语法树节点的父类。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut beginPos: Position`](prop-beginpos.md) | 获取或设置当前节点的起始的位置信息。 |
| [`mut endPos: Position`](prop-endpos.md) | 获取或设置当前节点的终止的位置信息。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`dump(): Unit`](dump.md) | 将当前语法树节点转化为树形结构的形态并进行打印。 |
| [`toTokens(): Tokens`](totokens.md) | 将语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
