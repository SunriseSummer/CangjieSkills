<!-- cj-doc kind="guide-leaf" level="6" id="language.macro.overview.6-典型示例代码.6-4-简单-dsl-类-linq-查询" parent="language.macro.overview.6-典型示例代码" -->
# 6.4 简单 DSL（类 LINQ 查询）

[← 6. 典型示例代码](index.md)

- `@linq(from x in 1..=10 where x % 2 == 1 select x * x)` 实现迷你查询语言
