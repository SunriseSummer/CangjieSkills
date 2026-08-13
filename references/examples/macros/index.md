<!-- cj-doc kind="example-category" level="3" id="examples.macros" parent="examples" -->
# 宏与语法树处理

[← 应用示例](../index.md)

开发独立宏包、生成声明，并用 std.ast 解析和遍历仓颉语法树。

| 示例 | 教学目标 |
|---|---|
| [宏包的开发、引用和编译](macro-package.md) | 以独立 macro package、路径依赖、--compile-macro 和 quote 插值组成完整双模块工程。 |
| [在宏中安全生成多条语句](multi-statement-codegen.md) | 固定结构用 quote；拼接独立 Tokens 时插入 TokenKind.NL，动态源码经 cangjieLex 转换时显式保留换行。 |
| [用声明宏生成 toString 方法](auto-to-string.md) | 解析 class 声明、收集字段、生成成员函数，并在不适用的声明上报告编译期诊断。 |
| [遍历语法树中的调用表达式](ast-call-visitor.md) | 把内存源码解析为 Program，以 Visitor 定位 CallExpr 并识别直接调用的函数名。 |
