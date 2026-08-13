<!-- cj-doc kind="guide-index" level="4" id="language.class.3-继承" parent="language.class" -->
# 3. 继承

[← 类](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [3.1 基本规则](3-1-基本规则.md) | 单继承：`class B <: A { }`。 |
| [3.2 `sealed` 抽象类](3-2-sealed-抽象类.md) | `sealed abstract class` — 仅同包内可继承 |
| [3.3 父类构造函数调用](3-3-父类构造函数调用.md) | 在子类 `init` 中：使用 `super(args)` 或 `this(args)` 作为函数体第一个表达式（互斥） |
| [3.4 重写与重定义](3-4-重写与重定义.md) | 重写（实例函数）：父类函数须为 `open`；子类使用 `override`（可选）。 |
