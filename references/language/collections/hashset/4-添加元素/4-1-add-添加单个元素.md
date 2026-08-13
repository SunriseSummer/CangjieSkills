<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.hashset.4-添加元素.4-1-add-添加单个元素" parent="language.collections.hashset.4-添加元素" -->
# 4.1 `add` — 添加单个元素

[← 4. 添加元素](index.md)

```cangjie cjtest=syntax id=syntax-664e00a9d1-1 form=unit
func add(element: T): Bool
```

- 元素不存在：添加成功，返回 `true`
- 元素已存在：不添加，返回 `false`

```cangjie cjtest=syntax id=syntax-664e00a9d1-2 form=stmt
let set = HashSet<String>()
set.add("apple")    // true（新增）
set.add("banana")   // true（新增）
set.add("apple")    // false（已存在，不添加）
println(set.size)   // 2
```
