<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.array.10-搜索与查找-需要-t.10-1-contains-判断是否包含元素" parent="language.collections.array.10-搜索与查找-需要-t" -->
# 10.1 `contains` — 判断是否包含元素

[← 10. 搜索与查找（需要 T <: Equatable<T>）](index.md)

`func contains(element: T): Bool`：判断是否包含元素。

```cangjie cjtest=syntax id=syntax-bd4d27eb84-1 form=unit
func contains(element: T): Bool
```

```cangjie cjtest=syntax id=syntax-bd4d27eb84-2 form=stmt
[1, 2, 3].contains(2)  // true
[1, 2, 3].contains(5)  // false
```
