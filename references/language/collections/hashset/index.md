<!-- cj-doc kind="guide-index" level="4" id="language.collections.hashset" parent="language.collections" -->
# HashSet

[← 集合类型](../index.md)

| 规则/任务 | 摘要 |
|---|---|
| [1. 概述](1-概述.md) | 哈希表实现 — 基于 HashMap 实现，平均 O(1) 的插入、删除、查找 |
| [2. 构造](2-构造/index.md) | 子页分别说明构造函数签名。 |
| [3. 属性](3-属性.md) | `let set = HashSet<Int64>([1, 2, 3])`：属性。 |
| [4. 添加元素](4-添加元素/index.md) | 元素不存在：添加成功，返回 `true` |
| [5. 查询](5-查询/index.md) | HashSet 是无序集合，不支持下标访问（无索引概念）。 |
| [6. 删除](6-删除/index.md) | 元素存在：移除成功，返回 `true` |
| [7. 集合运算](7-集合运算/index.md) | HashSet 支持集合的交集、并集、差集运算，返回新的 HashSet。 |
| [8. 遍历](8-遍历.md) | `HashSet` 可直接用于 `for-in` 遍历，但元素顺序不稳定，不能把迭代顺序当作排序结果。 |
| [9. 容量管理](9-容量管理.md) | `additional <= 0` 或剩余容量足够时不执行扩容 |
| [10. 判空](10-判空.md) | `func isEmpty(): Bool`：判空。 |
| [11. 拷贝](11-拷贝.md) | `func clone(): HashSet<T>`：拷贝。 |
| [12. 相等比较](12-相等比较.md) | `let a = HashSet<Int64>([1, 2, 3])`：相等比较。 |
| [13. 转为字符串（需要 T <: ToString）](13-转为字符串-需要-t-tostring.md) | `func toString(): String`：转为字符串（需要 T <: ToString）。 |
| [14. 常见用法总结](14-常见用法总结.md) | 典型 `HashSet` 流程包括去重、成员检查、交并差运算、条件过滤、子集判断和批量更新。 |
| [15. 注意事项](15-注意事项.md) | 速查`元素的要求`：`T` 必须实现 `Hashable` + `Equatable<T>`；`线程安全`：`HashSet` 非线程安全；`无下标访问`：HashSet 无序，不支持索引访问；另含更多表项。 |
