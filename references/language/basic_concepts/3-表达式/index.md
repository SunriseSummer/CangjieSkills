<!-- cj-doc kind="guide-index" level="4" id="language.basic_concepts.3-表达式" parent="language.basic_concepts" -->
# 3. 表达式

[← 基本概念](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [3.1 基本规则](3-1-基本规则.md) | 仓颉中所有可求值的程序元素都是表达式，包括算术表达式和 if/match 等复合表达式 |
| [3.2 if 条件判断](3-2-if-条件判断.md) | 语法：`if (cond) { exprs1 } else { exprs2 }`，`cond` 是 `Bool` 类型表达式 |
| [3.3 while / do-while 循环](3-3-while-do-while-循环.md) | 语法：`while (cond) { exprs }` 和 `do { exprs } while (cond)`，`cond` 是 `Bool` 类型表达式 |
| [3.4 for-in 循环](3-4-for-in-循环.md) | 语法：`for (item in sequence) { exprs }`，其中 `sequence` 类型须实现 `Iterable<T>` |
| [3.5 break / continue](3-5-break-continue.md) | `break` 退出循环，`continue` 跳至下一次迭代 |
| [3.6 match 模式匹配](3-6-match-模式匹配.md) | 语法：`match(expr) { case pattern => exprs ... }`，`expr` 是待匹配值，`pattern` 是候选模式 |
