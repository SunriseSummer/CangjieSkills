<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.hashset.7-集合运算.7-5-保留交集元素-retain" parent="language.collections.hashset.7-集合运算" -->
# 7.5 保留交集元素 `retain`

[← 7. 集合运算](index.md)

`func retain(all!: Set<T>): Unit`：保留交集元素 retain。

```cangjie cjtest=syntax id=syntax-b962816f2a-1 form=unit
func retain(all!: Set<T>): Unit
```

```cangjie cjtest=syntax id=syntax-b962816f2a-2 form=stmt
let a = HashSet<Int64>([1, 2, 3, 4])
let b = HashSet<Int64>([2, 4, 6])
a.retain(all: b)  // a = {2, 4}（原地修改）
```

---
