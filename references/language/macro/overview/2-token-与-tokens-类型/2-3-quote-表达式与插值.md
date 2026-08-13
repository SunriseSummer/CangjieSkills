<!-- cj-doc kind="guide-leaf" level="6" id="language.macro.overview.2-token-与-tokens-类型.2-3-quote-表达式与插值" parent="language.macro.overview.2-token-与-tokens-类型" -->
# 2.3 Quote 表达式与插值

[← 2. Token 与 Tokens 类型](index.md)

`quote(...)` 是语言表达式（`quote` 为关键字，不从 `std.ast` 导入）；在其中用 `$(expr)` 插入实现 `ToTokens` 的值。

- `quote(...)` 将代码模板转换为 `Tokens`
- 在 `quote` 内使用 `$(expr)` 插值来插入实现 `ToTokens` 的表达式
- 支持 `ToTokens` 的类型：所有 AST 节点类型、`Token`/`Tokens`、所有基本类型、`Array<T>`、`ArrayList<T>`
