<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.hashset.5-查询.5-2-toarray-转为数组" parent="language.collections.hashset.5-查询" -->
# 5.2 `toArray` — 转为数组

[← 5. 查询](index.md)

`func toArray(): Array<T>`：转为数组。

```cangjie cjtest=syntax id=syntax-90d6bbc1ea-1 form=unit
func toArray(): Array<T>
```

```cangjie cjtest=syntax id=syntax-90d6bbc1ea-2 form=stmt
let set = HashSet<Int64>([1, 2, 3])
let arr = set.toArray()  // [1, 2, 3]（顺序不保证）
```
