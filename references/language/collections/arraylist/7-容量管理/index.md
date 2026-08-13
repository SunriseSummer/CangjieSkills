<!-- cj-doc kind="guide-index" level="5" id="language.collections.arraylist.7-容量管理" parent="language.collections.arraylist" -->
# 7. 容量管理

[← ArrayList 类型](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [概述与共同规则](overview.md) | ArrayList 在元素超过容量时会自动扩容（重新分配内存 + 复制元素），频繁扩容会影响性能。 |
| [7.1 构造时预分配](7-1-构造时预分配.md) | `let list = ArrayList<Int64>(1000) // 预分配容量 1000`：构造时预分配。 |
| [7.2 运行时扩容](7-2-运行时扩容.md) | 当 `additional + 已使用容量` 超过 `Int64.Max` 时抛 `OverflowException` |
