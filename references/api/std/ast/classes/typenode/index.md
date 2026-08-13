<!-- cj-doc kind="api-type" level="5" id="std.ast.class.typenode" parent="std.ast" -->
# TypeNode

[← std.ast](../../index.md)

`open TypeNode <: Node`

所有类型节点的父类，继承自 Node。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut colon: Token`](prop-colon.md) | 获取或设置 TypeNode 节点中的操作符 ":"，可能为 ILLEGAL 的词法单元。 |
| [`mut typeParameterName: Token`](prop-typeparametername.md) | 获取或设置类型节点的参数，如：`(p1:Int64, p2:Int64)` 中的 `p1` 和 `p2`，可能为 ILLEGAL 的词法单元。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
| [`protected open dump(indent: UInt16): String`](dump.md) | 将当前语法树节点转化为树形结构的形态并进行打印。 |
