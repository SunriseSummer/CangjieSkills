<!-- cj-doc kind="guide-topic" level="3" id="language.class" parent="language" -->
# 类

[← 语言特性](../index.md)

类声明、构造与析构、继承、重写、属性、访问控制和 This 类型。

| 规则/任务 | 摘要 |
|---|---|
| [1. 类定义](1-类定义/index.md) | 使用 `class ClassName { ... }` 声明，仅可在顶层作用域定义 |
| [2. 对象创建与使用](2-对象创建与使用/index.md) | `let obj = ClassName(args)` — 调用构造函数 |
| [3. 继承](3-继承/index.md) | 单继承：`class B <: A { }`。 |
| [4. 属性（prop）在类中的使用](4-属性-prop-在类中的使用/index.md) | `prop name: Type { get() { ... } }` — 只读属性（类似 `let`） |
