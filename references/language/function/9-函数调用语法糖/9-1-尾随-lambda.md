<!-- cj-doc kind="guide-leaf" level="5" id="language.function.9-函数调用语法糖.9-1-尾随-lambda" parent="language.function.9-函数调用语法糖" -->
# 9.1 尾随 Lambda

[← 9. 函数调用语法糖](index.md)

- 当**最后一个参数**为函数类型且实参为 Lambda 时，Lambda 可置于括号**外部**：
  ```cangjie cjtest=syntax id=syntax-8cce03e9c4-1 form=stmt
  func myIf(cond: Bool, body: () -> Int64): Int64 {
      if (cond) { body() } else { 0 }
  }
  let result = myIf(true) { 100 }
  println(result)  // 100
  ```
- 若函数**仅有一个参数**（Lambda），括号可完全省略：
  ```cangjie cjtest=syntax id=syntax-8cce03e9c4-2 form=stmt
  func apply(f: (Int64) -> Int64): Int64 { f(5) }
  let result = apply { i => i * i }
  println(result)  // 25
  ```
- 在尾随 Lambda 位置，`=>` 可省略
