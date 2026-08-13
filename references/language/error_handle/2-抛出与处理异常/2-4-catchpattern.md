<!-- cj-doc kind="guide-leaf" level="5" id="language.error_handle.2-抛出与处理异常.2-4-catchpattern" parent="language.error_handle.2-抛出与处理异常" -->
# 2.4 CatchPattern

[← 2. 抛出与处理异常](index.md)

### 类型模式
1. **单类型**：`Identifier: ExceptionClass` — 捕获该类及子类，绑定到 `Identifier`
2. **联合类型**：`Identifier: E1 | E2 | ... | En` — 捕获任意列出的类型。绑定变量类型为所有列出类型的**最小公共父类型**

### 通配符模式
- `_` — 捕获**任何**异常（等价于 `e: Exception`）。无绑定

---
