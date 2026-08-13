<!-- cj-doc kind="guide-index" level="4" id="language.const.4-const-init" parent="language.const" -->
# 4. const init

[← 编译期常量](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [概述与共同规则](overview.md) | 如果一个 `struct` 或 `class` 定义了 `const` 构造器，那么这个 `struct`/`class` 实例可以用在 const 表达式中。 |
| [4.1 基本语法](4-1-基本语法.md) | 使用 `const init` 声明可在编译期求值的构造函数；函数体只能包含常量求值允许的操作。 |
| [4.2 规则](4-2-规则.md) | class 规则：不能具有 `var` 声明的实例成员变量；如果当前类型具有父类，当前的 `const init` 必须调用父类的 `const init`（可以显式调用或者隐式调用无参 `const init`），如果父类没有 `const init` 则报错 |
| [4.3 完整示例](4-3-完整示例.md) | 组合使用 `const init` 与 `const` 变量，在编译期构造结构体值并读取其成员。 |
