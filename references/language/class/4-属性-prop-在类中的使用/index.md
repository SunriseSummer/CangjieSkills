<!-- cj-doc kind="guide-index" level="4" id="language.class.4-属性-prop-在类中的使用" parent="language.class" -->
# 4. 属性（prop）在类中的使用

[← 类](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [4.1 定义](4-1-定义.md) | `prop name: Type { get() { ... } }` — 只读属性（类似 `let`） |
| [4.2 getter 与 setter](4-2-getter-与-setter.md) | getter：`() -> T` — 读取属性时执行 |
| [4.3 `mut` 限制](4-3-mut-限制.md) | 数值类型、元组、函数、`Bool`、`Unit`、`Nothing`、`String`、`Range`、`enum` 类型不能有 `mut` 属性 |
| [4.4 修饰符](4-4-修饰符.md) | 与成员函数相同的访问修饰符（`public`、`private`、`protected`、`internal`） |
| [4.5 抽象属性](4-5-抽象属性.md) | 在抽象类中：属性声明无实现体，非抽象子类须提供实现 |
| [4.6 实例属性与静态属性](4-6-实例属性与静态属性.md) | 实例属性：通过对象访问（`obj.prop`） |
