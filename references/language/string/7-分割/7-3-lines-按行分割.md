<!-- cj-doc kind="guide-leaf" level="5" id="language.string.7-分割.7-3-lines-按行分割" parent="language.string.7-分割" -->
# 7.3 `lines` — 按行分割

[← 7. 分割](index.md)

`func lines(): Iterator<String>`：按行分割。

```cangjie cjtest=syntax id=syntax-c05f270060-1 form=unit
func lines(): Iterator<String>
```

```cangjie cjtest=syntax id=syntax-c05f270060-2 form=stmt
let text = "line1\nline2\nline3"
for (line in text.lines()) {
    println(line)
}
// 输出：
// line1
// line2
// line3
```

---
