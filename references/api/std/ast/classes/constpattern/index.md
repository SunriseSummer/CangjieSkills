<!-- cj-doc kind="api-type" level="5" id="std.ast.class.constpattern" parent="std.ast" -->
# ConstPattern

[← std.ast](../../index.md)

`ConstPattern <: Pattern`

表示常量模式节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut litConstExpr: LitConstExpr`](prop-litconstexpr.md) | 获取或设置 ConstPattern 节点中的字面量表达式。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 ConstPattern 对象。 |
| [`init(inputs: Tokens)`](init.md) | 构造一个 ConstPattern 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
