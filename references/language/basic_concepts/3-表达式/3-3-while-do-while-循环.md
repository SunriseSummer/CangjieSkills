<!-- cj-doc kind="guide-leaf" level="5" id="language.basic_concepts.3-表达式.3-3-while-do-while-循环" parent="language.basic_concepts.3-表达式" -->
# 3.3 while / do-while 循环

[← 3. 表达式](index.md)

- 语法：`while (cond) { exprs }` 和 `do { exprs } while (cond)`，`cond` 是 `Bool` 类型表达式
- 返回类型始终为 `Unit`
- 条件表达式可以用 `let pattern <- expr` 做模式匹配
