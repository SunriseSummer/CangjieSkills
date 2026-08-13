<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.hashmap.2-构造.overview" parent="language.collections.hashmap.2-构造" -->
# 概述与共同规则

[← 2. 构造](index.md)

`let map = HashMap<String, Int64>()`：概述与共同规则。

```cangjie cjtest=syntax id=syntax-5ff7a4d56f-1 form=unit
import std.collection.*

// 空 HashMap（默认容量 16）
let map = HashMap<String, Int64>()

// 指定初始容量
let map2 = HashMap<String, Int64>(100)

// 从键值对数组构造
let map3 = HashMap<String, Int64>([("a", 1), ("b", 2), ("c", 3)])

// 从键值对集合构造
let map4 = HashMap<String, Int64>(map3)

// 指定大小 + 初始化函数
let map5 = HashMap<Int64, Int64>(5, {i => (i, i * i)})
// {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}
```
