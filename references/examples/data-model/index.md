<!-- cj-doc kind="example-category" level="3" id="examples.data-model" parent="examples" -->
# 值类型、枚举与模式匹配

[← 应用示例](../index.md)

用结构体值语义和带负载递归枚举表达数据，并通过穷举匹配处理分支。

| 示例 | 教学目标 |
|---|---|
| [用 mut 成员修改结构体副本](struct-mut.md) | mut 成员可原地修改 var 实例；结构体赋值仍是值拷贝，副本修改不影响原值。 |
| [用递归枚举表达式树](recursive-enum.md) | 用带负载构造器建立递归结构，并以穷举 match 递归求值。 |
| [为枚举派生或自定义相等性](enum-equatable.md) | 结构化判等使用 Derive；自定义规则则实现 Equatable，并用双层括号匹配枚举值元组。 |
