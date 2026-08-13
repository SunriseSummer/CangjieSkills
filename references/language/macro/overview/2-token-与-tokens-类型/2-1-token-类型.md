<!-- cj-doc kind="guide-leaf" level="6" id="language.macro.overview.2-token-与-tokens-类型.2-1-token-类型" parent="language.macro.overview.2-token-与-tokens-类型" -->
# 2.1 Token 类型

[← 2. Token 与 Tokens 类型](index.md)

- `Token` 是最小词法单元：标识符、字面量、关键字或运算符
- 每个 `Token` 有：类型（`TokenKind`）、内容、位置信息
- 构造函数：`Token(k: TokenKind)` 或 `Token(k: TokenKind, v: String)`
- 示例：`Token(TokenKind.ADD)` → `+`，`Token(TokenKind.IDENTIFIER, "x")` → `x`
