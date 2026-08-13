<!-- cj-doc kind="guide-leaf" level="5" id="language.collections.hashmap.12-转为字符串-需要-k-tostring-v-tostring" parent="language.collections.hashmap" -->
# 12. 转为字符串（需要 K <: ToString, V <: ToString）

[← HashMap 类型](index.md)

`func toString(): String`：转为字符串（需要 K <: ToString, V <: ToString）。

```cangjie cjtest=syntax id=syntax-4c127c5ea7-1 form=unit
func toString(): String
```

```cangjie cjtest=syntax id=syntax-4c127c5ea7-2 form=stmt
HashMap<String, Int64>([("a", 1), ("b", 2)]).toString()
// "[(a, 1), (b, 2)]"（顺序不保证）
```

---
