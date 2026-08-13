<!-- cj-doc kind="guide-index" level="4" id="language.type_system.2-子类型关系" parent="language.type_system" -->
# 2. 子类型关系

[← 类型系统](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [2.1 子类型关系来源](2-1-子类型关系来源.md) | 类继承：`class Sub <: Super {}` → `Sub <: Super` |
| [2.2 泛型类型的子类型关系](2-2-泛型类型的子类型关系.md) | 根据泛型定义中的继承声明确定，如 `class C<Z> <: I<Z, Z> {}` → `C<Bool> <: I<Bool, Bool>` |
