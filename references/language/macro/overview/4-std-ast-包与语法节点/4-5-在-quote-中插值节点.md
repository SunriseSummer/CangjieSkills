<!-- cj-doc kind="guide-leaf" level="6" id="language.macro.overview.4-std-ast-包与语法节点.4-5-在-quote-中插值节点" parent="language.macro.overview.4-std-ast-包与语法节点" -->
# 4.5 在 Quote 中插值节点

[← 4. std.ast 包与语法节点](index.md)

在 `quote` 中用 `$(value)` 插入实现 `ToTokens` 的值；精确导入时须导入 `ToTokens`，插入 `Token` 还须导入 `Token`，且插值不会自动补优先级括号。

- 任何节点：`$(node)` 在 `quote` 内
- `ArrayList<Node>` 可插值（项依次列出并换行）
- 精确导入时须导入 `ToTokens`；插入 `Token` 值时还须导入 `Token`
- 插值**不会**自动为优先级添加括号，须手动包装
