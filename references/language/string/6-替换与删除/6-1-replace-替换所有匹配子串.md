<!-- cj-doc kind="guide-leaf" level="5" id="language.string.6-替换与删除.6-1-replace-替换所有匹配子串" parent="language.string.6-替换与删除" -->
# 6.1 `replace` — 替换所有匹配子串

[← 6. 替换与删除](index.md)

`func replace(old: String, new: String): String`：替换所有匹配子串。

```cangjie cjtest=syntax id=syntax-ab45fd98ed-1 form=unit
func replace(old: String, new: String): String
```

```cangjie cjtest=syntax id=syntax-ab45fd98ed-2 form=stmt
"aabbcc".replace("bb", "XX") // "aaXXcc"
"aaa".replace("a", "bb")     // "bbbbbb"
```
