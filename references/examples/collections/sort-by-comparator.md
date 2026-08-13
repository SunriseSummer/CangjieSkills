<!-- cj-doc kind="example-leaf" level="4" id="examples.collections.sort-by-comparator" parent="examples.collections" -->
# 用 lessThan 完成多字段排序

[← 集合查找、统计与排序](index.md)

元组或元素未实现 Comparable、需要多字段顺序时，使用 `sort(data, lessThan: {left, right => ...})` Lambda 比较器；比较器返回 left 是否应排在 right 前，并须形成严格弱序。

## 选择比较器重载

元素本身实现 `Comparable` 时直接 `sort(data)`；能提取单个可比较键时优先用 `key!`；需要多字段、条件化或领域特定顺序时使用 `lessThan!`。`lessThan!(left, right)` 返回 `left` 是否应排在 `right` 前，不要求元素类型实现 `Comparable`，因此适合元组和领域记录。

## 按多个字段排序元组

下例先按名称升序，同名时再按序号升序。Lambda 的两个参数写在同一参数列表中；`lessThan` 是命名参数，调用时去掉声明中的感叹号。

```cangjie cjtest=run id=api.sort.less-than.run form=unit timeout=20s
package sort_less_than_example

import std.sort.sort

main(): Unit {
    let rows = [("worker", 2), ("api", 3), ("worker", 1), ("api", 1)]
    sort(rows, lessThan: { left, right =>
        if (left[0] == right[0]) {
            left[1] < right[1]
        } else {
            left[0] < right[0]
        }
    })
    for ((name, sequence) in rows) {
        println("${name}:${sequence}")
    }
}
```

预期标准输出：

```text cjtest=expect for=api.sort.less-than.run stream=stdout match=exact
api:1
api:3
worker:1
worker:2
```

比较器必须形成严格弱序：不要让相等元素互相“小于”，也不要根据会在排序过程中变化的外部状态返回结果。只需倒序时优先使用 `descending: true`，不要反转一个本可复用的标准比较器。
