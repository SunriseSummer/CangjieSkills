<!-- cj-doc kind="example-leaf" level="4" id="examples.collections.hashmap-tuple-iteration" parent="examples.collections" -->
# 解构遍历 HashMap 键值

[← 集合查找、统计与排序](index.md)

`HashMap<K, V>` 直接产生 `(K, V)` 元组；用 `for ((key, value) in map)` 解构，不使用 `.0`/`.1`，也不依赖遍历顺序。

## 已验证的 HashMap 元组解构

`HashMap<K, V>` 的迭代项是 `(K, V)` 元组。在 `for-in` 变量处写双层括号可直接取得键和值；若先保存一个元组，则以编译期整数下标 `entry[0]`、`entry[1]` 访问，不使用其他语言的 `.0`、`.1` 字段语法。

哈希表的遍历顺序不稳定。下面只累计和值与键长度，因此结果不依赖迭代次序：

```cangjie cjtest=run id=language.hashmap-tuple-iteration.run form=unit timeout=20s
package hashmap_tuple_iteration_example

import std.collection.*

main(): Unit {
    let scores = HashMap<String, Int64>([("red", 2), ("blue", 3), ("green", 5)])
    var total: Int64 = 0
    var keyBytes: Int64 = 0

    for ((key, value) in scores) {
        total += value
        keyBytes += key.size
    }

    let first: (String, Int64) = ("fixed", 7)
    println(total)
    println(keyBytes)
    println("${first[0]}=${first[1]}")
}
```

预期标准输出：

```text cjtest=expect for=language.hashmap-tuple-iteration.run stream=stdout match=exact
10
12
fixed=7
```
