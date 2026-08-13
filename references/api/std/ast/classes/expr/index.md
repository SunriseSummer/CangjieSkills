<!-- cj-doc kind="api-type" level="5" id="std.ast.class.expr" parent="std.ast" -->
# Expr

[← std.ast](../../index.md)

`open Expr <: Node`

所有表达式节点的父类，继承自 Node 节点。

## 方法

| 签名 | 功能 |
|---|---|
| [`protected open dump(_: UInt16): String`](dump.md) | 将当前语法树节点转化为树形结构的形态并进行打印，需要被子类重写。 |
| [`protected open precedence(): Int64`](precedence.md) | 返回当前表达式节点的优先级。 |
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
