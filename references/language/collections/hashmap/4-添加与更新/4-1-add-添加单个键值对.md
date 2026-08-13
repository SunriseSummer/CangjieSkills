<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.hashmap.4-添加与更新.4-1-add-添加单个键值对" parent="language.collections.hashmap.4-添加与更新" -->
# 4.1 `add` — 添加单个键值对

[← 4. 添加与更新](index.md)

```cangjie cjtest=syntax id=syntax-c2fe3e4e8a-1 form=unit
func add(key: K, value: V): Option<V>
```

- 键不存在：插入新键值对，返回 `None`
- 键已存在：用新值替换旧值，返回旧值 `Some(oldValue)`

```cangjie cjtest=syntax id=syntax-c2fe3e4e8a-2 form=stmt
let map = HashMap<String, Int64>()
map.add("a", 1)          // None（新增）
map.add("a", 99)         // Some(1)（替换，返回旧值 1）
println(map["a"])         // 99
```
