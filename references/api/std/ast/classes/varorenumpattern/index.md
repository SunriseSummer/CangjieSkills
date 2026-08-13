<!-- cj-doc kind="api-type" level="5" id="std.ast.class.varorenumpattern" parent="std.ast" -->
# VarOrEnumPattern

[← std.ast](../../index.md)

`VarOrEnumPattern <: Pattern`

表示当模式的标识符为 `Enum` 构造器时的节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut identifier: Token`](prop-identifier.md) | 获取或设置 VarOrEnumPattern 节点中的标识符的词法单元。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 VarOrEnumPattern 对象。 |
| [`init(identifier: Token)`](init.md) | 构造一个 VarOrEnumPattern 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
