<!-- cj-doc kind="example-category" level="3" id="examples.collections" parent="examples" -->
# 集合查找、统计与排序

[← 应用示例](../index.md)

用 HashMap 的 Option 返回值安全查找和累计数据，解构遍历键值，并按派生键或多字段比较器排序。

| 示例 | 教学目标 |
|---|---|
| [用 HashMap 统计词频](hashmap-counting.md) | 从 get 返回的 Option 读取旧值，再覆盖写回累计结果。 |
| [安全读取 HashMap](hashmap-safe-get.md) | 区分键不存在与已有值，使用模式匹配或默认值消费 Option。 |
| [解构遍历 HashMap 键值](hashmap-tuple-iteration.md) | `HashMap<K, V>` 直接产生 `(K, V)` 元组；用 `for ((key, value) in map)` 解构，不使用 `.0`/`.1`，也不依赖遍历顺序。 |
| [按派生键稳定排序](sort-by-key.md) | 把比较规则集中到键提取函数，使排序调用保持简洁和可读。 |
| [用 lessThan 完成多字段排序](sort-by-comparator.md) | 元组或元素未实现 Comparable、需要多字段顺序时，使用 `sort(data, lessThan: {left, right => ...})` Lambda 比较器；比较器返回 left 是否应排在 right 前，并须形成严格弱序。 |
