<!-- cj-doc kind="guide-leaf" level="5" id="language.string.5-搜索与检查.5-1-contains-包含子串" parent="language.string.5-搜索与检查" -->
# 5.1 `contains` — 包含子串

[← 5. 搜索与检查](index.md)

`func contains(str: String): Bool`：包含子串。

```cangjie cjtest=syntax id=syntax-34ad50a5ce-1 form=unit
func contains(str: String): Bool
```

```cangjie cjtest=syntax id=syntax-34ad50a5ce-2 form=stmt
"Hello World".contains("World") // true
"Hello World".contains("world") // false（大小写敏感）
```
