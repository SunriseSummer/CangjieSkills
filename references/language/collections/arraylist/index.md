<!-- cj-doc kind="guide-index" level="4" id="language.collections.arraylist" parent="language.collections" -->
# ArrayList 类型

[← 集合类型](../index.md)

| 规则/任务 | 摘要 |
|---|---|
| [1. 概述](1-概述.md) | 动态数组 — 可自动扩容，无需预先指定大小 |
| [2. 构造](2-构造/index.md) | 子页分别说明构造函数签名。 |
| [3. 属性](3-属性.md) | `let list = ArrayList<Int64>([10, 20, 30])`：属性。 |
| [4. 元素访问](4-元素访问/index.md) | 索引从 `0` 开始，类型为 `Int64` |
| [5. 添加元素](5-添加元素/index.md) | `at` 越界抛出 `IndexOutOfBoundsException` |
| [6. 删除元素](6-删除元素/index.md) | 越界抛出 `IndexOutOfBoundsException` |
| [7. 容量管理](7-容量管理/index.md) | ArrayList 在元素超过容量时会自动扩容（重新分配内存 + 复制元素），频繁扩容会影响性能。 |
| [8. 切片](8-切片.md) | `range.step` 必须为 1，否则抛 `IllegalArgumentException` |
| [9. 反转](9-反转.md) | `func reverse(): Unit`：反转。 |
| [10. 拷贝](10-拷贝.md) | `func clone(): ArrayList<T>`：拷贝。 |
| [11. 转换](11-转换/index.md) | 子页分别说明转为 Array、转为字符串（需要 T <: ToString）。 |
| [12. 判空与包含](12-判空与包含/index.md) | 子页分别说明contains（需要 T <: Equatable<T>）。 |
| [13. 相等比较（需要 T <: Equatable<T>）](13-相等比较-需要-t.md) | `let a = ArrayList<Int64>([1, 2, 3])`：相等比较（需要 T <: Equatable<T>）。 |
| [14. 迭代](14-迭代.md) | `func iterator(): Iterator<T>`：迭代。 |
| [15. 排序](15-排序/index.md) | 子页分别说明使用 std.sort。 |
| [16. 常见用法总结](16-常见用法总结.md) | 典型 `ArrayList` 流程包括动态收集、批量添加、安全访问、条件删除、排序转换和容量预分配。 |
