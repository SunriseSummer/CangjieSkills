<!-- cj-doc kind="guide-leaf" level="5" id="language.for.6-最优实践.6-2-range-计数循环" parent="language.for.6-最优实践" -->
# 6.2 Range 计数循环

[← 6. 最优实践](index.md)

- 固定次数循环优先用 Range，无需手动维护计数器：
  ```cangjie cjtest=syntax id=syntax-7bca9bab1e-1 form=stmt
  let n = 3
  // ✅ 推荐
  for (_ in 0..n) { println("hello") }

  // ❌ 不推荐
  var i = 0
  while (i < n) { println("hello"); i++ }
  ```
