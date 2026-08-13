<!-- cj-doc kind="guide-leaf" level="5" id="language.basic_concepts.3-表达式.3-6-match-模式匹配" parent="language.basic_concepts.3-表达式" -->
# 3.6 match 模式匹配

[← 3. 表达式](index.md)

- 语法：`match(expr) { case pattern => exprs ... }`，`expr` 是待匹配值，`pattern` 是候选模式
- `=>` 左侧模式被匹配后，将执行右侧的 `exprs` 并跳过后续 `case` 分支
- 注意，exprs 不需要被大括号包裹，多个表达式各占一行
- 详见[模式匹配](../../pattern_match/index.md)

---
