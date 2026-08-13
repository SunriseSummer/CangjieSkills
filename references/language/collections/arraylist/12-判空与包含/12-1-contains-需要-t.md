<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.arraylist.12-判空与包含.12-1-contains-需要-t" parent="language.collections.arraylist.12-判空与包含" -->
# 12.1 `contains`（需要 T <: Equatable<T>）

[← 12. 判空与包含](index.md)

`func contains(element: T): Bool`：contains（需要 T <: Equatable<T>）。

```cangjie cjtest=syntax id=syntax-8cc3a0ae88-1 form=unit
func contains(element: T): Bool
```

```cangjie cjtest=syntax id=syntax-8cc3a0ae88-2 form=stmt
let list = ArrayList<Int64>([1, 2, 3])
println(list.contains(2))  // true
println(list.contains(5))  // false
```

---
