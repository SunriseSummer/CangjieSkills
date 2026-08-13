<!-- cj-doc kind="guide-index" level="4" id="language.pattern_match.4-其他模式匹配语法-场景" parent="language.pattern_match" -->
# 4. 其他模式匹配语法/场景

[← 模式匹配](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [4.1 变量定义与 for-in](4-1-变量定义与-for-in.md) | 不可反驳的元组模式可直接解构：`let (x, y) = pair`；迭代元组元素时写 `for ((x, y) in values)`。 |
| [4.2 if-let 条件匹配](4-2-if-let-条件匹配.md) | 在 `if` 条件中使用 `let pattern <- expression` 语法糖，匹配成功进入 `if` 分支，绑定变量仅在 `if` 分支内可用。 |
| [4.3 while-let 循环匹配](4-3-while-let-循环匹配.md) | 在 `while` 条件中使用 `let pattern <- expression`，匹配成功时执行循环体，失败时退出循环。 |
