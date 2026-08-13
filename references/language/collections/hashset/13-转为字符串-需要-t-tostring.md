<!-- cj-doc kind="guide-leaf" level="5" id="language.collections.hashset.13-转为字符串-需要-t-tostring" parent="language.collections.hashset" -->
# 13. 转为字符串（需要 T <: ToString）

[← HashSet](index.md)

`func toString(): String`：转为字符串（需要 T <: ToString）。

```cangjie cjtest=syntax id=syntax-96d47fd9f5-1 form=unit
func toString(): String
```

```cangjie cjtest=syntax id=syntax-96d47fd9f5-2 form=stmt
HashSet<Int64>([1, 2, 3]).toString()
// "[1, 2, 3]"（顺序不保证）
```

---
