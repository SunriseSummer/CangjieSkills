<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.array.10-搜索与查找-需要-t.10-4-removeprefix-removesuffix" parent="language.collections.array.10-搜索与查找-需要-t" -->
# 10.4 `removePrefix` / `removeSuffix`

[← 10. 搜索与查找（需要 T <: Equatable<T>）](index.md)

`func removePrefix(prefix: Array<T>): Array<T>`：removePrefix / removeSuffix。

```cangjie cjtest=syntax id=syntax-2f9058fa1d-1 form=unit
func removePrefix(prefix: Array<T>): Array<T>
func removeSuffix(suffix: Array<T>): Array<T>
```

```cangjie cjtest=syntax id=syntax-2f9058fa1d-2 form=stmt
[1, 2, 3, 4].removePrefix([1, 2]) // [3, 4]
[1, 2, 3, 4].removeSuffix([3, 4]) // [1, 2]
[1, 2, 3].removePrefix([9, 8])    // [1, 2, 3]（无匹配，返回原数组）
```
