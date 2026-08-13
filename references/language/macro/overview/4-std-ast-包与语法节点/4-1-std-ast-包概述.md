<!-- cj-doc kind="guide-leaf" level="6" id="language.macro.overview.4-std-ast-包与语法节点.4-1-std-ast-包概述" parent="language.macro.overview.4-std-ast-包与语法节点" -->
# 4.1 std.ast 包概述

[← 4. std.ast 包与语法节点](index.md)

`std.ast` 提供 Token、AST、解析、遍历与诊断能力；受 `cjlint` 检查的项目应精确导入，`quote` 插值还须导入提供扩展的 `ToTokens`，插入 `Token` 时同时导入该类型。

`std.ast` 是仓颉宏编程的核心依赖包，提供源码的词法分析和语法解析能力。主要包含：

- **词法单元**：`Token`（单个词法单元）和 `Tokens`（词法单元序列），以及 `TokenKind` 枚举（表示所有词法结构：符号、关键字、标识符等）
- **语法解析器**：将 `Tokens` 解析为抽象语法树（AST）节点对象的函数族（`parseExpr`、`parseDecl`、`parseType` 等）
- **AST 节点体系**：以 `Node` 为基类的完整语法树节点类型，涵盖声明（`Decl`）、表达式（`Expr`）、类型（`TypeNode`）、模式（`Pattern`）四大分支
- **Visitor 遍历框架**：`Visitor` 抽象类提供节点访问函数，配合 `traverse()` 实现 AST 遍历
- **嵌套宏上下文通信**：`assertParentContext`、`insideParentContext`、`setItem`、`getChildMessages` 等函数，用于宏展开时的上下文信息传递
- **诊断报告**：`diagReport` 函数在宏展开阶段输出 `ERROR`/`WARNING` 级别的编译信息
- **辅助工具**：`cangjieLex`（字符串转 Tokens）、`compareTokens`（Tokens 比较）、`ToTokens`/`ToBytes` 接口

> 按实际使用精确导入，避免触发 `cjlint` 的通配导入规则。`quote` 是语言关键字；使用插值时导入提供扩展的 `ToTokens`，插入 `Token` 值时还须导入 `Token`。
