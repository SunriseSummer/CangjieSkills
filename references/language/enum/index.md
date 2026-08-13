<!-- cj-doc kind="guide-topic" level="3" id="language.enum" parent="language" -->
# 枚举

[← 语言特性](../index.md)

枚举构造器、成员、递归定义、名称冲突与接口实现。

| 规则/任务 | 摘要 |
|---|---|
| [1. 枚举类型定义](1-枚举类型定义/index.md) | 使用 `enum` 关键字 + 名称 + `{}` 体定义 |
| [2. 枚举的使用](2-枚举的使用/index.md) | 通过 `TypeName.Constructor` 或直接使用构造器名创建实例 |
| [3. 枚举与 Equatable](3-枚举与-equatable/index.md) | 枚举不会自动支持 `==`/`!=`；结构化判等优先自动派生，自定义判等则显式实现 `Equatable` 的两个操作符。 |
| [4. Option 类型](4-option-类型.md) | Option<T> 是仓颉预置的一个枚举类型，可表示或有或无的值，引用有效值前必须匹配判断，用于应对空值安全问题，详见 Option。 |
| [5. 完整可运行示例](5-完整可运行示例.md) | 递归枚举可表示表达式树；用 `match` 解构不同构造器并递归计算其负载。 |
