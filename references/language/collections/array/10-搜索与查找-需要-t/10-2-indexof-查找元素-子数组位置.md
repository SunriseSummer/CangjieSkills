<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.array.10-搜索与查找-需要-t.10-2-indexof-查找元素-子数组位置" parent="language.collections.array.10-搜索与查找-需要-t" -->
# 10.2 `indexOf` — 查找元素/子数组位置

[← 10. 搜索与查找（需要 T <: Equatable<T>）](index.md)

`func indexOf(element: T): Option<Int64>`：查找元素/子数组位置。

```cangjie cjtest=syntax id=syntax-2105e09692-1 form=unit
func indexOf(element: T): Option<Int64>
func indexOf(element: T, fromIndex: Int64): Option<Int64>
func indexOf(subArray: Array<T>): Option<Int64>
```

```cangjie cjtest=syntax id=syntax-2105e09692-2 form=stmt
[10, 20, 30, 20].indexOf(20)      // Some(1)
[10, 20, 30, 20].indexOf(20, 2)   // Some(3)  — 从索引 2 开始搜索
[1, 2, 3, 4].indexOf([2, 3])      // Some(1)  — 子数组位置
[1, 2, 3].indexOf(99)             // None
```
