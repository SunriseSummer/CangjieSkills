<!-- cj-doc kind="guide-leaf" level="5" id="language.string.6-替换与删除.6-2-removeprefix-removesuffix-删除前缀-后缀" parent="language.string.6-替换与删除" -->
# 6.2 `removePrefix` / `removeSuffix` — 删除前缀/后缀

[← 6. 替换与删除](index.md)

```cangjie cjtest=syntax id=syntax-0074dee565-1 form=unit
func removePrefix(prefix: String): String
func removeSuffix(suffix: String): String
```

- 如果字符串不以指定前缀/后缀开头/结尾，返回原字符串

```cangjie cjtest=syntax id=syntax-0074dee565-2 form=stmt
"HelloWorld".removePrefix("Hello") // "World"
"HelloWorld".removeSuffix("World") // "Hello"
"HelloWorld".removePrefix("xyz")   // "HelloWorld"
```

---
