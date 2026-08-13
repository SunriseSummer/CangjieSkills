<!-- cj-doc kind="api-member-index" level="5" id="std.sort.func.sort" parent="std.sort" -->
# sort

[← std.sort](../../index.md)

本重载族包含 12 个签名；直接按表中签名选择，带示例的签名可继续进入详情页。

| 签名 | 功能 |
|---|---|
| [`sort<T, K>(data: Array<T>, key!: (T) -> K, stable!: Bool = false, descending!: Bool = false): Unit where K <: Comparable<K>`](sort-t-k-array-t-t-k-bool-bool-where-k-comparable-k.md) | 对数组按照指定的键（键与键之间可比较）进行排序。 |
| [`sort<T, K>(data: ArrayList<T>, key!: (T) -> K, stable!: Bool = false, descending!: Bool = false): Unit where K <: Comparable<K>`](sort-t-k-arraylist-t-t-k-bool-bool-where-k-comparable-k.md) | 对 `ArrayList` 按照指定的键（键与键之间可比较）进行排序。 |
| [`sort<T, K>(data: List<T>, key!: (T) -> K, stable!: Bool = false, descending!: Bool = false): Unit where K <: Comparable<K>`](sort-t-k-list-t-t-k-bool-bool-where-k-comparable-k.md) | 对 `List` 按照指定的键（键与键之间可比较）进行排序。 |
| [`sort<T>(data: Array<T>, lessThan!: (T, T) -> Bool, stable!: Bool = false, descending!: Bool = false): Unit`](sort-t-array-t-t-t-bool-bool-bool.md) | 对数组按照比较函数进行排序。 |
| [`sort<T>(data: Array<T>, by!: (T, T) -> Ordering, stable!: Bool = false, descending!: Bool = false): Unit`](sort-t-array-t-t-t-ordering-bool-bool.md) | 对数组按照比较函数进行排序。 |
| [`sort<T>(data: Array<T>, stable!: Bool = false, descending!: Bool = false): Unit where T <: Comparable<T>`](sort-t-array-t-bool-bool-where-t-comparable-t.md) | 对数组进行排序。 |
| [`sort<T>(data: ArrayList<T>, lessThan!: (T, T) -> Bool, stable!: Bool = false, descending!: Bool = false): Unit`](sort-t-arraylist-t-t-t-bool-bool-bool.md) | 用 `lessThan!(left, right)` 对任意元素类型的 `ArrayList<T>` 原地排序；比较器返回 `left` 是否应排在 `right` 前，适合元组和未实现 Comparable 的记录。 |
| [`sort<T>(data: ArrayList<T>, by!: (T, T) -> Ordering, stable!: Bool = false, descending!: Bool = false): Unit`](sort-t-arraylist-t-t-t-ordering-bool-bool.md) | 对 `ArrayList` 按照比较函数进行排序。 |
| [`sort<T>(data: ArrayList<T>, stable!: Bool = false, descending!: Bool = false): Unit where T <: Comparable<T>`](sort-t-arraylist-t-bool-bool-where-t-comparable-t.md) | 对 `ArrayList<T>` 原地排序，但仅适用于 `T <: Comparable<T>`；元组或未实现 Comparable 的记录应改用 `key!`、`lessThan!` 或 `by!` 重载。 |
| [`sort<T>(data: List<T>, lessThan!: (T, T) -> Bool, stable!: Bool = false, descending!: Bool = false): Unit`](sort-t-list-t-t-t-bool-bool-bool.md) | 对 `List` 按照比较函数进行排序。 |
| [`sort<T>(data: List<T>, by!: (T, T) -> Ordering, stable!: Bool = false, descending!: Bool = false): Unit`](sort-t-list-t-t-t-ordering-bool-bool.md) | 对 `List` 按照比较函数进行排序。 |
| [`sort<T>(data: List<T>, stable!: Bool = false, descending!: Bool = false): Unit where T <: Comparable<T>`](sort-t-list-t-bool-bool-where-t-comparable-t.md) | 对 `List` 进行排序。 |
