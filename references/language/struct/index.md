<!-- cj-doc kind="guide-topic" level="3" id="language.struct" parent="language" -->
# 结构体

[← 语言特性](../index.md)

结构体声明、构造、值语义、成员修改与 mut 函数限制。

| 规则/任务 | 摘要 |
|---|---|
| [1. 结构体定义](1-结构体定义/index.md) | 使用 `struct` 关键字 + 名称 + `{}` 体定义 |
| [2. 创建结构体实例](2-创建结构体实例/index.md) | 通过结构体类型名调用构造函数：`let r = Rectangle(10, 20)` |
| [3. `mut` 函数](3-mut-函数/index.md) | 由于结构体是值类型，普通实例成员函数不能修改实例的成员变量 |
