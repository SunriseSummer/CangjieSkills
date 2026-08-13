<!-- cj-doc kind="guide-topic" level="3" id="language.for" parent="language" -->
# for-in 与迭代

[← 语言特性](../index.md)

for-in、Iterable、Iterator、Range、where、解构和自定义迭代器。

| 规则/任务 | 摘要 |
|---|---|
| [1. for-in 基本语法](1-for-in-基本语法/index.md) | 迭代对象须实现 `Iterable<T>` 接口 |
| [2. Range 区间类型](2-range-区间类型/index.md) | 半开区间（左闭右开）：`start..end` — 不包含 `end` |
| [3. Iterable 与 Iterator 接口](3-iterable-与-iterator-接口/index.md) | `Iterator` 自身扩展 `Iterable`，可直接用于 for-in |
| [4. 迭代进阶](4-迭代进阶/index.md) | 也可以用 `toRuneArray()` 转为 `Array<Rune>` 后再迭代，但 `runes()` 返回迭代器，避免额外的数组分配，是更推荐的方式。 |
| [5. 自定义可迭代类型](5-自定义可迭代类型.md) | 实现 `Iterable<T>` 接口即可获得 for-in 支持。 |
| [6. 最优实践](6-最优实践/index.md) | for-in 比手动 `while` + `iterator()` 更安全、简洁，且编译器可优化 |
