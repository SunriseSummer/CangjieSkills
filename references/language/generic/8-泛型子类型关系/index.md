<!-- cj-doc kind="guide-index" level="4" id="language.generic.8-泛型子类型关系" parent="language.generic" -->
# 8. 泛型子类型关系

[← 泛型](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [8.1 实例化子类型关系](8-1-实例化子类型关系.md) | 若 `class C<Z> <: I<Z, Z>`，则 `C<Bool> <: I<Bool, Bool>`、`C<D> <: I<D, D>` 等 |
| [8.2 型变 — 用户自定义类型不变](8-2-型变-用户自定义类型不变.md) | 所有用户自定义泛型类型在所有类型参数上不变 |
| [8.3 内置例外](8-3-内置例外.md) | 元组类型在每个元素类型上协变 |
