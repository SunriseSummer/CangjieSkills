<!-- cj-doc kind="guide-index" level="5" id="language.macro.overview.4-std-ast-包与语法节点" parent="language.macro.overview" -->
# 4. std.ast 包与语法节点

[← 总览与通用规则](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [4.1 std.ast 包概述](4-1-std-ast-包概述.md) | `std.ast` 提供 Token、AST、解析、遍历与诊断能力；受 `cjlint` 检查的项目应精确导入，`quote` 插值还须导入提供扩展的 `ToTokens`，插入 `Token` 时同时导入该类型。 |
| [4.2 AST 节点层次](4-2-ast-节点层次.md) | `Node` — 所有语法节点的基类 |
| [4.3 解析函数](4-3-解析函数.md) | 也可通过直接构造函数创建节点：`BinaryExpr(quote(a + b))`、`FuncDecl(quote(func f1(...) {...}))` 等 |
| [4.4 常用节点类型与属性](4-4-常用节点类型与属性.md) | 速查`FuncDecl`：`identifier`、`funcParams`、`declType`、`block`、`modifiers`；`ClassDecl`：`identifier`、`body`、`modifiers`、`superTypes`；`StructDecl`：`identifier`、`body`、`modifiers`；另含更多表项。 |
| [4.5 在 Quote 中插值节点](4-5-在-quote-中插值节点.md) | 在 `quote` 中用 `$(value)` 插入实现 `ToTokens` 的值；精确导入时须导入 `ToTokens`，插入 `Token` 还须导入 `Token`，且插值不会自动补优先级括号。 |
| [4.6 Visitor 遍历模式](4-6-visitor-遍历模式.md) | 继承 `Visitor` 并覆盖目标节点类型的 `visit`，再调用 `node.traverse(visitor)` 遍历；需要停止当前子树时调用 `breakTraverse()`。 |
| [4.7 辅助工具函数](4-7-辅助工具函数.md) | 固定结构优先用 `quote`；多条独立 `Tokens` 之间插入 `Token(TokenKind.NL)`，动态源码交给 `cangjieLex` 时显式保留 `\n`，否则展开后的相邻语句会粘连。 |
