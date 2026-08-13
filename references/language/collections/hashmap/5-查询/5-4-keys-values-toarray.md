<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.hashmap.5-查询.5-4-keys-values-toarray" parent="language.collections.hashmap.5-查询" -->
# 5.4 `keys` / `values` / `toArray`

[← 5. 查询](index.md)

`func keys(): EquatableCollection<K>   // 所有键`：keys / values / toArray。

```cangjie cjtest=syntax id=syntax-d1868bb945-1 form=unit
func keys(): EquatableCollection<K>   // 所有键
func values(): Collection<V>          // 所有值
func toArray(): Array<(K, V)>         // 所有键值对数组
```

```cangjie cjtest=syntax id=syntax-d1868bb945-2 form=stmt
let map = HashMap<String, Int64>([("a", 1), ("b", 2)])
let allKeys = map.keys()       // 包含 "a", "b"
let allValues = map.values()   // 包含 1, 2
let pairs = map.toArray()     // [("a", 1), ("b", 2)]（顺序不保证）
```
