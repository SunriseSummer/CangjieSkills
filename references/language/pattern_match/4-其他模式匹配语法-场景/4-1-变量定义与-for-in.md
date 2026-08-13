<!-- cj-doc kind="guide-leaf" level="5" id="language.pattern_match.4-其他模式匹配语法-场景.4-1-变量定义与-for-in" parent="language.pattern_match.4-其他模式匹配语法-场景" -->
# 4.1 变量定义与 for-in

[← 4. 其他模式匹配语法/场景](index.md)

不可反驳的元组模式可直接解构：`let (x, y) = pair`；迭代元组元素时写 `for ((x, y) in values)`。

```cangjie cjtest=syntax id=syntax-c6942c1f86-1 form=stmt
let (x, y) = (100, 200) // 元组解构
for ((i, j) in [(1, 2), (3, 4)]) { println(i + j) } // for-in 元组解构
```

**适用于不可反驳模式**
