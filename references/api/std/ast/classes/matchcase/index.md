<!-- cj-doc kind="api-type" level="5" id="std.ast.class.matchcase" parent="std.ast" -->
# MatchCase

[← std.ast](../../index.md)

`MatchCase <: Node`

表示 `match` 表达式中的一个 `case` 节点。

## 属性与字段

| 签名 | 功能 |
|---|---|
| [`mut arrow: Token`](prop-arrow.md) | 获取或设置 MatchCase 中的 `=>` 操作符的词法单元。 |
| [`mut bitOrs: Tokens`](prop-bitors.md) | 获取或设置 MatchCase 中的 `\|` 操作符的词法单元序列，可能为空。 |
| [`mut block: Block`](prop-block.md) | 获取或设置 MatchCase 中的一系列声明或表达式节点。 |
| [`mut expr: Expr`](prop-expr.md) | 获取或设置 MatchCase 中位于 case 后的表达式节点。 |
| [`mut keywordC: Token`](prop-keywordc.md) | 获取或设置 MatchCase 内的 `case` 关键字的词法单元。 |
| [`mut keywordW: Token`](prop-keywordw.md) | 获取或设置 MatchCase 中可选的关键字 `where` 的词法单元，可能为 ILLEGAL 的词法单元。 |
| [`mut patternGuard: Expr`](prop-patternguard.md) | 获取或设置 MatchCase 中可选的 pattern guard 表达式节点。 |
| [`mut patterns: ArrayList<Pattern>`](prop-patterns.md) | 获取或设置 MatchCase 中位于 case 后的 `pattern` 列表。 |

## 构造函数

| 签名 | 功能 |
|---|---|
| [`init()`](init.md) | 构造一个默认的 MatchCase 对象。 |

## 方法

| 签名 | 功能 |
|---|---|
| [`toTokens(): Tokens`](totokens.md) | 将当前语法树节点转化为 Tokens 类型。 |
| [`traverse(v: Visitor): Unit`](traverse.md) | 遍历当前语法树节点及其子节点。 |
