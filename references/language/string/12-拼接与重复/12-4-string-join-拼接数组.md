<!-- cj-doc kind="guide-leaf" level="5" id="language.string.12-拼接与重复.12-4-string-join-拼接数组" parent="language.string.12-拼接与重复" -->
# 12.4 `String.join` — 拼接数组

[← 12. 拼接与重复](index.md)

`let parts = ["2024", "06", "15"]`：拼接数组。

```cangjie cjtest=syntax id=syntax-2a19c4f0ad-1 form=stmt
let parts = ["2024", "06", "15"]
let date = String.join(parts, delimiter: "-") // "2024-06-15"
```
