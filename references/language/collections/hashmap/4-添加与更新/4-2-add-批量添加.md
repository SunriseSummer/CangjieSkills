<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.hashmap.4-添加与更新.4-2-add-批量添加" parent="language.collections.hashmap.4-添加与更新" -->
# 4.2 `add` — 批量添加

[← 4. 添加与更新](index.md)

`func add(all!: Collection<(K, V)>): Unit`：批量添加。

```cangjie cjtest=syntax id=syntax-822e0a4e71-1 form=unit
func add(all!: Collection<(K, V)>): Unit
```

```cangjie cjtest=syntax id=syntax-822e0a4e71-2 form=stmt
map.add(all: [("b", 2), ("c", 3)])
map.add(all: otherMap)
```
