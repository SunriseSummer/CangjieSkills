<!-- cj-doc kind="guide-index" level="4" id="language.for.6-最优实践" parent="language.for" -->
# 6. 最优实践

[← for-in 与迭代](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [6.1 优先使用 for-in](6-1-优先使用-for-in.md) | for-in 比手动 `while` + `iterator()` 更安全、简洁，且编译器可优化 |
| [6.2 Range 计数循环](6-2-range-计数循环.md) | 固定次数循环优先用 Range，无需手动维护计数器。 |
| [6.3 where 替代 if](6-3-where-替代-if.md) | 过滤场景优先用 `where` 子句，减少嵌套、提升可读性（见 4.2） |
| [6.4 注意无序集合](6-4-注意无序集合.md) | `HashMap` 和 `HashSet` 迭代顺序不确定，不应依赖遍历顺序 |
| [6.5 常见错误](6-5-常见错误.md) | 避免在循环体中误用不可变循环变量、越界区间或不能产生迭代器的对象；根据诊断修正迭代源而不是强制转换。 |
