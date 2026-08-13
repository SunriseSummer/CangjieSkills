<!-- cj-doc kind="guide-index" level="4" id="language.reflect_and_annotation.2-反射-动态特性" parent="language.reflect_and_annotation" -->
# 2. 反射（动态特性）

[← 反射与注解](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [概述与共同规则](overview.md) | 反射指程序在运行时访问、检测和修改自身状态或行为的机制。 |
| [2.1 获取 TypeInfo](2-1-获取-typeinfo.md) | 核心反射类型 `TypeInfo` 记录任意类型的类型信息。 |
| [2.2 访问成员](2-2-访问成员.md) | 用 `ClassTypeInfo` 查询 `public` 成员；成员集合顺序不稳定，应按名称或注解选择，读值后用 `as T` 解包，写值前检查 `isMutable()`。 |
