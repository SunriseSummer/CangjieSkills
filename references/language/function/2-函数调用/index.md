<!-- cj-doc kind="guide-index" level="4" id="language.function.2-函数调用" parent="language.function" -->
# 2. 函数调用

[← 函数与 Lambda](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [2.1 基本调用语法](2-1-基本调用语法.md) | 调用函数：`f(arg1, arg2)` |
| [2.2 非命名参数调用](2-2-非命名参数调用.md) | 按位置传递表达式：`add(x, y)` |
| [2.3 命名参数调用](2-3-命名参数调用.md) | 只有定义中写成 `paramName!: T` 的形参才能使用 `paramName: value` 调用；普通的 `paramName: T` 是位置参数，调用时不能添加名称标签 |
| [2.4 默认值](2-4-默认值.md) | 只有命名参数可以声明默认值；调用时省略该参数使用默认表达式，也可按名称显式覆盖。 |
