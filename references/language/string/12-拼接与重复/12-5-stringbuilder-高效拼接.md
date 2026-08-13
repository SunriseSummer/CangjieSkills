<!-- cj-doc kind="guide-leaf" level="5" id="language.string.12-拼接与重复.12-5-stringbuilder-高效拼接" parent="language.string.12-拼接与重复" -->
# 12.5 `StringBuilder` — 高效拼接

[← 12. 拼接与重复](index.md)

大量拼接时建议使用 `StringBuilder`：

```cangjie cjtest=syntax id=syntax-3d93557f4d-1 form=stmt
let sb = StringBuilder()
sb.append("Hello")
sb.append(", ")
sb.append("World!")
let result = sb.toString() // "Hello, World!"
```

---
