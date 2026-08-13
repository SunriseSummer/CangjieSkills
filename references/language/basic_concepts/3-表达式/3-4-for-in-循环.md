<!-- cj-doc kind="guide-leaf" level="5" id="language.basic_concepts.3-表达式.3-4-for-in-循环" parent="language.basic_concepts.3-表达式" -->
# 3.4 for-in 循环

[← 3. 表达式](index.md)

- 语法：`for (item in sequence) { exprs }`，其中 `sequence` 类型须实现 `Iterable<T>`
- 迭代变量 item 不可变，如果循环体中不引用迭代变量，可用通配符 `_` 占位
- 支持元组解构：`for ((x, y) in arr)`
- `where` 子句过滤迭代：`for (i in 0..8 where i % 2 == 1)`
- String，Range（1..=100），Array/HashMap 等集合类型都已实现 `Iterable<T>`，可直接用 for-in 遍历
- 详见 [for-in](../../for/index.md)
