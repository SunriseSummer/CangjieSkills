<!-- cj-doc kind="guide-index" level="4" id="language.enum.3-枚举与-equatable" parent="language.enum" -->
# 3. 枚举与 Equatable

[← 枚举](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [概述与共同规则](overview.md) | 枚举不会自动支持 `==`/`!=`；结构化判等优先自动派生，自定义判等则显式实现 `Equatable` 的两个操作符。 |
| [完整示例：枚举与 Equatable](完整示例-枚举与-equatable.md) | 结构化判等优先用 `@Derive[Equatable]`；自定义判等时显式实现 `==` 和 `!=`。 |
| [手动实现自定义相等语义](手动实现自定义相等语义.md) | 当判等规则不是简单的逐字段比较时，手动实现 `Equatable`。 |
| [常见错误](常见错误.md) | 枚举默认不支持 `==`；只声明 `Equatable<T>` 但未派生或实现判等操作符仍会编译失败。 |
