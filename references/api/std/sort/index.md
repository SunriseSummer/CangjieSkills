<!-- cj-doc kind="api-package" level="4" id="std.sort" parent="api.std" -->
# std.sort

[← std 包索引](../index.md)

`std.sort` 顶层函数 `sort(data)` 可对实现 Comparable 的 Array、ArrayList 或 List 升序排序；也可传 `key`、`lessThan`、`by` 或 `descending` 自定义规则。

包路径：`std.sort`。在代码中只导入实际使用的类型或函数。

## 顶层函数

| 声明 | 功能 |
|---|---|
| [`sort(…) — 12 个重载`](functions/sort/index.md) | 原地排序重载选择：元素实现 Comparable 时直接 sort(data)；单个派生键用 key!；返回 Bool 的自定义或多字段比较用 lessThan!；已有 Ordering 比较器才用 by!。 |
