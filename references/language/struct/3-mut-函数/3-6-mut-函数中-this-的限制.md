<!-- cj-doc kind="guide-leaf" level="5" id="language.struct.3-mut-函数.3-6-mut-函数中-this-的限制" parent="language.struct.3-mut-函数" -->
# 3.6 `mut` 函数中 `this` 的限制

[← 3. `mut` 函数](index.md)

- `this` **不能被** Lambda 或嵌套函数捕获
- `this` **不能作为表达式使用**（如返回值）
- 实例成员变量**不能被** `mut` 函数内的 Lambda 捕获
