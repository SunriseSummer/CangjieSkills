<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.array.2-构造.overview" parent="language.collections.array.2-构造" -->
# 概述与共同规则

[← 2. 构造](index.md)

`let arr = [1, 2, 3, 4, 5]`：概述与共同规则。

```cangjie cjtest=syntax id=syntax-2e7c4b3cd1-1 form=stmt
// 字面量构造（最常用）
let arr = [1, 2, 3, 4, 5]

// 空数组
let empty = Array<Int64>()

// 指定大小 + 重复值
let zeros = Array<Int64>(5, repeat: 0)  // [0, 0, 0, 0, 0]

// 指定大小 + 初始化函数
let arr2 = Array<Int64>(5, {i => i * 2})  // [0, 2, 4, 6, 8]
```
