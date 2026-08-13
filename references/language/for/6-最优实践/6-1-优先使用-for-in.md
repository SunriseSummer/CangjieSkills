<!-- cj-doc kind="guide-leaf" level="5" id="language.for.6-最优实践.6-1-优先使用-for-in" parent="language.for.6-最优实践" -->
# 6.1 优先使用 for-in

[← 6. 最优实践](index.md)

- for-in 比手动 `while` + `iterator()` 更安全、简洁，且编译器可优化
- 需要索引时可结合 `enumerate()`（若集合支持），否则使用 Range：
  ```cangjie cjtest=syntax id=syntax-989dc20b17-1 form=stmt
  let arr = [10, 20, 30]
  for (i in 0..arr.size) {
      println("arr[${i}] = ${arr[i]}")
  }
  ```
