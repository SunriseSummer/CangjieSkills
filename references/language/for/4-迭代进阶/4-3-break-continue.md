<!-- cj-doc kind="guide-leaf" level="5" id="language.for.4-迭代进阶.4-3-break-continue" parent="language.for.4-迭代进阶" -->
# 4.3 break / continue

[← 4. 迭代进阶](index.md)

- `break` 提前退出循环，`continue` 跳到下一次迭代
- 二者类型均为 `Nothing`
```cangjie cjtest=syntax id=syntax-c4ddcabc95-1 form=stmt
for (i in 0..100) {
    if (i > 5) { break }
    if (i % 2 == 0) { continue }
    println(i)  // 1, 3, 5
}
```
