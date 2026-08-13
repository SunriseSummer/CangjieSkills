<!-- cj-doc kind="guide-leaf" level="5" id="language.collections.array.14-排序-使用-std-sort" parent="language.collections.array" -->
# 14. 排序（使用 std.sort）

[← Array 类型](index.md)

Array 本身不提供排序方法，需导入 `std.sort`：

```cangjie cjtest=run id=language.array.std-sort.run form=unit timeout=30s
package array_std_sort_example

import std.sort.*

main(): Unit {
    let ascending = [3, 1, 4, 1, 5, 9]
    sort(ascending)
    println(ascending)

    let descending = [3, 1, 4, 1, 5, 9]
    sort(descending, lessThan: { left, right => left > right })
    println(descending)
}
```

```text cjtest=expect for=language.array.std-sort.run stream=stdout match=exact
[1, 1, 3, 4, 5, 9]
[9, 5, 4, 3, 1, 1]
```

---
