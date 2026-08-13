<!-- cj-doc kind="api-type" level="5" id="std.ast.class.prefixtype" parent="std.ast" -->
# PrefixType

[← std.ast](../../index.md)

`PrefixType <: TypeNode`

表示带问号的前缀类型节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut baseType: TypeNode`](prop-basetype.md) | 获取或设置 PrefixType 节点中的类型节点，如 `var a: ?A` 中的 `A`。 |
| [`mut prefixOps: Tokens`](prop-prefixops.md) | 获取或设置 PrefixType 节点中前缀操作符集合。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 PrefixType 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 PrefixType 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
