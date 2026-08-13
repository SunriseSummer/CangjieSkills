<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.arraylist.11-转换.11-2-转为字符串-需要-t-tostring" parent="language.collections.arraylist.11-转换" -->
# 11.2 转为字符串（需要 T <: ToString）

[← 11. 转换](index.md)

`func toString(): String`：转为字符串（需要 T <: ToString）。

```cangjie cjtest=syntax id=syntax-3f6c40461d-1 form=unit
func toString(): String
```

```cangjie cjtest=syntax id=syntax-3f6c40461d-2 form=stmt
ArrayList<Int64>([1, 2, 3]).toString()  // "[1, 2, 3]"
```

---
