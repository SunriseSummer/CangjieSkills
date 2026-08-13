<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.hashset.2-构造.overview" parent="language.collections.hashset.2-构造" -->
# 概述与共同规则

[← 2. 构造](index.md)

`let set = HashSet<String>()`：概述与共同规则。

```cangjie cjtest=syntax id=syntax-9bd60cd207-1 form=unit
import std.collection.*

// 空 HashSet（默认容量 16）
let set = HashSet<String>()

// 指定初始容量
let set2 = HashSet<String>(100)

// 从数组构造
let set3 = HashSet<Int64>([0, 1, 2])

// 从集合构造
let set4 = HashSet<Int64>(set3)

// 指定大小 + 初始化函数
let set5 = HashSet<Int64>(5, {i => i * i})
// {0, 1, 4, 9, 16}
```
