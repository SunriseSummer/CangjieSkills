<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.array.9-映射与扁平化.9-2-flatten-扁平化二维数组" parent="language.collections.array.9-映射与扁平化" -->
# 9.2 `flatten` — 扁平化二维数组

[← 9. 映射与扁平化](index.md)

`func flatten(): Array<T>`：扁平化二维数组。

```cangjie cjtest=syntax id=syntax-8f05b73d1f-1 form=unit
// 仅对 Array<Array<T>> 可用
func flatten(): Array<T>
```

```cangjie cjtest=syntax id=syntax-8f05b73d1f-2 form=stmt
let arr2d = [[1, 2], [3, 4], [5]]
let flat = arr2d.flatten() // [1, 2, 3, 4, 5]
```

---
