<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.hashmap.5-查询.5-2-安全访问-get" parent="language.collections.hashmap.5-查询" -->
# 5.2 安全访问 `get`

[← 5. 查询](index.md)

`func get(key: K): Option<V>`：安全访问 get。

```cangjie cjtest=syntax id=syntax-d122ffad71-1 form=unit
func get(key: K): Option<V>
```

```cangjie cjtest=syntax id=syntax-d122ffad71-2 form=stmt
let map = HashMap<String, Int64>([("a", 1)])
println(map.get("a"))    // Some(1)
println(map.get("xyz"))  // None（不抛异常）
```
