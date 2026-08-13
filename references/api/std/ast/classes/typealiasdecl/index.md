<!-- cj-doc kind="api-type" level="5" id="std.ast.class.typealiasdecl" parent="std.ast" -->
# TypeAliasDecl

[← std.ast](../../index.md)

`TypeAliasDecl <: Decl`

表示类型别名节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut aliasType: TypeNode`](prop-aliastype.md) | 获取或设置将要别名的类型。 |
| [`mut assign: Token`](prop-assign.md) | 获取或设置标识符和 `type` 之间的 `=`。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 TypeAliasDecl 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 TypeAliasDecl 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
