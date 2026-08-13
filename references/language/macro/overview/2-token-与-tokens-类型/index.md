<!-- cj-doc kind="guide-index" level="5" id="language.macro.overview.2-token-与-tokens-类型" parent="language.macro.overview" -->
# 2. Token 与 Tokens 类型

[← 总览与通用规则](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [2.1 Token 类型](2-1-token-类型.md) | `Token` 是最小词法单元：标识符、字面量、关键字或运算符 |
| [2.2 Tokens 类型](2-2-tokens-类型.md) | `Tokens` 是 `Token` 对象的序列 |
| [2.3 Quote 表达式与插值](2-3-quote-表达式与插值.md) | `quote(...)` 是语言表达式（`quote` 为关键字，不从 `std.ast` 导入）；在其中用 `$(expr)` 插入实现 `ToTokens` 的值。 |
| [2.4 Quote 转义规则](2-4-quote-转义规则.md) | `quote` 中未匹配的括号须用 `\` 转义：`\(` 或 `\)` |
