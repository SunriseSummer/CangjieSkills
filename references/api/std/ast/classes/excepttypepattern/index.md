<!-- cj-doc kind="api-type" level="5" id="std.ast.class.excepttypepattern" parent="std.ast" -->
# ExceptTypePattern

[← std.ast](../../index.md)

`ExceptTypePattern <: Pattern`

表示一个用于异常模式状态下的节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut colon: Token`](prop-colon.md) | 获取或设置 ExceptTypePattern 节点中的 ":" 操作符的词法单元。 |
| [`mut pattern: Pattern`](prop-pattern.md) | 获取或设置 ExceptTypePattern 节点中的模式节点。 |
| [`mut types: ArrayList<TypeNode>`](prop-types.md) | 获取或设置 ExceptTypePattern 节点中有类型列表。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 ExceptTypePattern 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 ExceptTypePattern 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
