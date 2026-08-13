<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.hashmap.5-查询.5-3-contains-键是否存在" parent="language.collections.hashmap.5-查询" -->
# 5.3 `contains` — 键是否存在

[← 5. 查询](index.md)

`func contains(key: K): Bool`：键是否存在。

```cangjie cjtest=syntax id=syntax-e59eaf4d33-1 form=unit
func contains(key: K): Bool
func contains(all!: Collection<K>): Bool
```

```cangjie cjtest=syntax id=syntax-e59eaf4d33-2 form=stmt
let map = HashMap<String, Int64>([("a", 1), ("b", 2)])
println(map.contains("a"))                    // true
println(map.contains("xyz"))                  // false
println(map.contains(all: ["a", "b"]))       // true
println(map.contains(all: ["a", "c"]))       // false（c 不存在）
```
