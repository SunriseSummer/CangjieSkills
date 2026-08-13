<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.arraylist.2-构造.overview" parent="language.collections.arraylist.2-构造" -->
# 概述与共同规则

[← 2. 构造](index.md)

`let list = ArrayList<Int64>()`：概述与共同规则。

```cangjie cjtest=syntax id=syntax-c211bd5d4e-1 form=unit
import std.collection.*

// 空 ArrayList（默认容量 16）
let list = ArrayList<Int64>()

// 指定初始容量
let list2 = ArrayList<Int64>(100)

// 从 Array 字面量构造
let list3 = ArrayList<Int64>([1, 2, 3])

// 从其他 Collection 构造
let list4 = ArrayList<Int64>(list3)

// 指定大小 + 初始化函数
let list5 = ArrayList<Int64>(5, {i => i * 10})  // [0, 10, 20, 30, 40]

// 使用 of 静态方法（支持变长参数语法）
let list6 = ArrayList.of(1, 2, 3)
```
