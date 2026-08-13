<!-- cj-doc kind="guide-leaf" level="6" id="language.macro.overview.7-最优实践指导.7-4-ast-操作" parent="language.macro.overview.7-最优实践指导" -->
# 7.4 AST 操作

[← 7. 最优实践指导](index.md)

- 使用 `parseDecl`/`parseExpr` 将 `Tokens` 转为强类型节点后再操作
- 修改节点后用 `node.toTokens()` 转回 `Tokens` 返回
- 利用 `Visitor` 模式遍历复杂 AST，避免手动递归
- 使用 `dump()` 调试 AST 结构
