<!-- cj-doc kind="api-type" level="5" id="std.ast.class.argument" parent="std.ast" -->
# Argument

[← std.ast](../../index.md)

`Argument <: Node`

表示函数调用的实参节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut colon: Token`](prop-colon.md) | 获取或设置 Argument 节点中的操作符 ":"，可能为 ILLEGAL 的词法单元。 |
| [`mut expr: Expr`](prop-expr.md) | 获取或设置 Argument 节点中的表达式，如 `arg:value` 中的 `value`。 |
| [`mut identifier: Token`](prop-identifier.md) | 获取或设置 Argument 节点中的标识符，如 `arg:value` 中的 `arg`，可能为 ILLEGAL 的词法单元。 |
| [`mut keyword: Token`](prop-keyword.md) | 获取或设置 Argument 节点中的关键字 `inout`，可能为 ILLEGAL 的词法单元。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 Argument 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
