<!-- cj-doc kind="guide-index" level="4" id="language.for.4-迭代进阶" parent="language.for" -->
# 4. 迭代进阶

[← for-in 与迭代](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [4.1 元组解构](4-1-元组解构.md) | 元素类型为元组时可在 `for-in` 变量处直接解构；`HashMap<K, V>` 迭代元素是 `(K, V)`，典型写法为 `for ((key, value) in map)`，且顺序不稳定。 |
| [4.2 where 子句过滤](4-2-where-子句过滤.md) | `where` 在循环体执行前过滤，比循环体内 `if` 更简洁。 |
| [4.3 break / continue](4-3-break-continue.md) | `break` 提前退出循环，`continue` 跳到下一次迭代 |
| [4.4 String 迭代](4-4-string-迭代.md) | 也可以用 `toRuneArray()` 转为 `Array<Rune>` 后再迭代，但 `runes()` 返回迭代器，避免额外的数组分配，是更推荐的方式。 |
