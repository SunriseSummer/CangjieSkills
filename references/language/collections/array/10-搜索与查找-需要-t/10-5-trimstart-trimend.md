<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.array.10-搜索与查找-需要-t.10-5-trimstart-trimend" parent="language.collections.array.10-搜索与查找-需要-t" -->
# 10.5 `trimStart` / `trimEnd`

[← 10. 搜索与查找（需要 T <: Equatable<T>）](index.md)

`func trimStart(elements: Array<T>): Array<T>`：trimStart / trimEnd。

```cangjie cjtest=syntax id=syntax-6bb653d92d-1 form=unit
func trimStart(elements: Array<T>): Array<T>
func trimStart(predicate: (T) -> Bool): Array<T>
func trimEnd(elements: Array<T>): Array<T>
func trimEnd(predicate: (T) -> Bool): Array<T>
```

```cangjie cjtest=syntax id=syntax-6bb653d92d-2 form=stmt
[0, 0, 1, 2, 0].trimStart([0])           // [1, 2, 0]
[0, 0, 1, 2, 0].trimEnd([0])             // [0, 0, 1, 2]
[0, 1, 2, 3].trimStart { v => v < 2 }    // [2, 3]
```

---
