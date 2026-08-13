<!-- cj-doc kind="guide-topic" level="3" id="language.const" parent="language" -->
# 编译期常量

[← 语言特性](../index.md)

const 变量、表达式、函数、构造函数与编译期求值限制。

| 规则/任务 | 摘要 |
|---|---|
| [1. const 变量](1-const-变量/index.md) | 使用 `const` 修饰符声明，表示编译时常量，深度不可变 |
| [2. const 表达式](2-const-表达式.md) | 数值类型、`Bool`、`Unit`、`Rune`、`String`（不包含插值字符串）的字面量 |
| [3. const 函数](3-const-函数/index.md) | 用 `const` 修饰符声明 |
| [4. const init](4-const-init/index.md) | 如果一个 `struct` 或 `class` 定义了 `const` 构造器，那么这个 `struct`/`class` 实例可以用在 const 表达式中。 |
