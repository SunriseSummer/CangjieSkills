<!-- cj-doc kind="guide-index" level="4" id="language.struct.3-mut-函数" parent="language.struct" -->
# 3. `mut` 函数

[← 结构体](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [3.1 问题](3-1-问题.md) | 由于结构体是值类型，普通实例成员函数不能修改实例的成员变量 |
| [3.2 解决方案](3-2-解决方案.md) | 结构体用 `mut func` 声明可原地修改字段的实例成员；只能通过可变结构体变量调用。 |
| [3.3 `mut` 允许使用的位置](3-3-mut-允许使用的位置.md) | 仅在 `interface`、`struct` 和结构体扩展中 |
| [3.4 `mut` 不能修饰静态函数](3-4-mut-不能修饰静态函数.md) | `public mut static func g(): Unit {} // 错误`：mut 不能修饰静态函数。 |
| [3.5 `mut` 也可修饰运算符函数](3-5-mut-也可修饰运算符函数.md) | `struct A`：mut 也可修饰运算符函数。 |
| [3.6 `mut` 函数中 `this` 的限制](3-6-mut-函数中-this-的限制.md) | `this` 不能被 Lambda 或嵌套函数捕获 |
| [3.7 接口中的 `mut`](3-7-接口中的-mut.md) | 接口函数可声明为 `mut` |
| [3.8 `mut` 函数使用限制](3-8-mut-函数使用限制.md) | `struct Foo`：mut 函数使用限制。 |
