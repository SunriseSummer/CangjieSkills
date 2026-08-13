<!-- cj-doc kind="guide-leaf" level="5" id="language.string.5-搜索与检查.5-2-startswith-endswith-前缀-后缀检查" parent="language.string.5-搜索与检查" -->
# 5.2 `startsWith` / `endsWith` — 前缀/后缀检查

[← 5. 搜索与检查](index.md)

`func startsWith(prefix: String): Bool`：前缀/后缀检查。

```cangjie cjtest=syntax id=syntax-e775d51a20-1 form=unit
func startsWith(prefix: String): Bool
func endsWith(suffix: String): Bool
```

```cangjie cjtest=syntax id=syntax-e775d51a20-2 form=stmt
"hello.cj".startsWith("hello") // true
"hello.cj".endsWith(".cj")     // true
```
