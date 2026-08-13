<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.array.10-搜索与查找-需要-t.10-3-lastindexof-查找最后出现位置" parent="language.collections.array.10-搜索与查找-需要-t" -->
# 10.3 `lastIndexOf` — 查找最后出现位置

[← 10. 搜索与查找（需要 T <: Equatable<T>）](index.md)

`func lastIndexOf(element: T): Option<Int64>`：查找最后出现位置。

```cangjie cjtest=syntax id=syntax-c755b157ae-1 form=unit
func lastIndexOf(element: T): Option<Int64>
func lastIndexOf(subArray: Array<T>): Option<Int64>
```

```cangjie cjtest=syntax id=syntax-c755b157ae-2 form=stmt
[1, 2, 3, 2, 1].lastIndexOf(2) // Some(3)
```
