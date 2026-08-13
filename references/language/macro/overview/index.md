<!-- cj-doc kind="guide-index" level="4" id="language.macro.overview" parent="language.macro" -->
# 总览与通用规则

[← 宏](../index.md)

| 规则/任务 | 摘要 |
|---|---|
| [1. 宏概述](1-宏概述/index.md) | 宏是特殊函数，输入和输出均为程序片段（非值） |
| [2. Token 与 Tokens 类型](2-token-与-tokens-类型/index.md) | `Token` 是最小词法单元：标识符、字面量、关键字或运算符 |
| [3. 宏实现](3-宏实现/index.md) | 若属性宏立即用 `parseDecl(inputTokens)` 把输入解析为声明，并与普通注解或其他属性宏叠加，应把该宏放在最靠近声明的位置；否则输入可能仍以另一注解的 token 开头，不能直接得到期望的声明节点。 |
| [4. std.ast 包与语法节点](4-std-ast-包与语法节点/index.md) | `std.ast` 是仓颉宏编程的核心依赖包，提供源码的词法分析和语法解析能力。 |
| [5. 宏包编译与构建](5-宏包编译与构建/index.md) | 详细的编译构建指导请查阅`./build/README.md`，包含 cjc/cjpm 编译命令、项目结构、不同平台配置、并行宏展开、调试模式等完整说明。 |
| [6. 典型示例代码](6-典型示例代码/index.md) | 属性宏 `@power[10](n)` 在编译时展开幂运算循环 |
| [7. 最优实践指导](7-最优实践指导/index.md) | 宏定义必须在 `macro package` 中，与调用代码分离为独立模块 |
