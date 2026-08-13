<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.array.5-切片与分割.5-4-splitat-在指定位置分割" parent="language.collections.array.5-切片与分割" -->
# 5.4 `splitAt` — 在指定位置分割

[← 5. 切片与分割](index.md)

`func splitAt(index: Int64): (Array<T>, Array<T>)`：在指定位置分割。

```cangjie cjtest=syntax id=syntax-b20ab2a3dd-1 form=unit
func splitAt(index: Int64): (Array<T>, Array<T>)
```

```cangjie cjtest=syntax id=syntax-b20ab2a3dd-2 form=stmt
let arr = [0, 1, 2, 3, 4]
let (left, right) = arr.splitAt(2) // left=[0, 1], right=[2, 3, 4]
```

---
