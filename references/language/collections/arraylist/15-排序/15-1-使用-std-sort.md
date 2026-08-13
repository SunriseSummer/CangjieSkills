<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.arraylist.15-排序.15-1-使用-std-sort" parent="language.collections.arraylist.15-排序" -->
# 15.1 使用 std.sort

[← 15. 排序](index.md)

提供可独立构建的示例，演示使用 std.sort。

```cangjie cjtest=compile id=verified-bedd7055f3-1
package arraylist_sort_example

import std.sort.*
import std.collection.*

main(): Unit {
    let list = ArrayList<Int64>([3, 1, 4, 1, 5])
    sort(list)
    println(list) // [1, 1, 3, 4, 5]
}
```
