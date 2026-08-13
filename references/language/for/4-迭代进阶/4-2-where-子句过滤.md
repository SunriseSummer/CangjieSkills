<!-- cj-doc kind="guide-leaf" level="5" id="language.for.4-迭代进阶.4-2-where-子句过滤" parent="language.for.4-迭代进阶" -->
# 4.2 where 子句过滤

[← 4. 迭代进阶](index.md)

- `where` 在循环体执行前过滤，比循环体内 `if` 更简洁：
```cangjie cjtest=syntax id=syntax-f58ddde564-1 form=stmt
// ✅ 推荐：where 过滤
for (i in 0..20 where i % 3 == 0) {
    println(i)  // 0, 3, 6, 9, 12, 15, 18
}

// ❌ 不推荐：循环体内 if 判断
for (i in 0..20) {
    if (i % 3 == 0) {
        println(i)
    }
}
```
