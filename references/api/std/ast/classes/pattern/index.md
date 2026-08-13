<!-- cj-doc kind="api-type" level="5" id="std.ast.class.pattern" parent="std.ast" -->
# Pattern

[← std.ast](../../index.md)

`open Pattern <: Node`

所有模式匹配节点的父类，继承自 Node 节点。

## 方法

| 签名 | 功能 |
|---|---|
| [`protected open dump(_: UInt16): String`](dump.md) | 将当前语法树节点转化为树形结构的形态并进行打印，需要被子类重写。 |
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
