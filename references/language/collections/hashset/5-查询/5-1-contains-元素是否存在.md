<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.hashset.5-查询.5-1-contains-元素是否存在" parent="language.collections.hashset.5-查询" -->
# 5.1 `contains` — 元素是否存在

[← 5. 查询](index.md)

`func contains(element: T): Bool`：元素是否存在。

```cangjie cjtest=syntax id=syntax-9d11213541-1 form=unit
func contains(element: T): Bool
func contains(all!: Collection<T>): Bool
```

```cangjie cjtest=syntax id=syntax-9d11213541-2 form=stmt
let set = HashSet<String>(["apple", "banana", "orange"])
println(set.contains("apple"))                    // true
println(set.contains("grape"))                    // false
println(set.contains(all: ["apple", "banana"]))  // true
println(set.contains(all: ["apple", "grape"]))   // false（grape 不存在）
```
