<!-- cj-doc kind="guide-index" level="4" id="language.for.3-iterable-与-iterator-接口" parent="language.for" -->
# 3. Iterable 与 Iterator 接口

[← for-in 与迭代](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [3.1 接口定义](3-1-接口定义.md) | 实现 `Iterable<T>.iterator()` 即可用于 `for-in`；返回的 `Iterator<T>` 通过 `next()` 逐项产生 `Some`，结束时返回 `None`。 |
| [3.2 for-in 脱糖](3-2-for-in-脱糖.md) | `for (item in source)` 会取得 `source.iterator()`，并反复调用 `next()`，直到迭代器返回 `None`。 |
| [3.3 已实现 Iterable 的内置类型](3-3-已实现-iterable-的内置类型.md) | 速查`Range<T>`：`T`；`Array<T>`：`T`；`ArrayList<T>`：`T`；另含更多表项。 |
