<!-- cj-doc kind="guide-index" level="5" id="language.collections.hashset.7-集合运算" parent="language.collections.hashset" -->
# 7. 集合运算

[← HashSet](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [概述与共同规则](overview.md) | HashSet 支持集合的交集、并集、差集运算，返回新的 HashSet。 |
| [7.1 交集 `&`](7-1-交集.md) | `operator func &(other: ReadOnlySet<T>): HashSet<T>`：交集 &。 |
| [7.2 并集 `\|`](7-2-并集.md) | `operator func \|(other: ReadOnlySet<T>): HashSet<T>`：并集 \|。 |
| [7.3 差集 `-`](7-3-差集.md) | `operator func -(other: ReadOnlySet<T>): HashSet<T>`：差集 -。 |
| [7.4 子集判断](7-4-子集判断.md) | `func subsetOf(other: ReadOnlySet<T>): Bool`：子集判断。 |
| [7.5 保留交集元素 `retain`](7-5-保留交集元素-retain.md) | `func retain(all!: Set<T>): Unit`：保留交集元素 retain。 |
