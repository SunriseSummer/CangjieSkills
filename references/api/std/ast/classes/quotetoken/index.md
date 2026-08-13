<!-- cj-doc kind="api-type" level="5" id="std.ast.class.quotetoken" parent="std.ast" -->
# QuoteToken

[← std.ast](../../index.md)

`QuoteToken <: Expr`

表示 `quote` 表达式节点内任意合法的 `token`。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut tokens: Tokens`](prop-tokens.md) | 获取 QuoteToken 内的 Tokens。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
