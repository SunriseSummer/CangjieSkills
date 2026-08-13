<!-- cj-doc kind="guide-leaf" level="5" id="language.string.5-搜索与检查.5-4-lastindexof-查找最后出现位置" parent="language.string.5-搜索与检查" -->
# 5.4 `lastIndexOf` — 查找最后出现位置

[← 5. 搜索与检查](index.md)

`func lastIndexOf(b: Byte): Option<Int64>`：查找最后出现位置。

```cangjie cjtest=syntax id=syntax-d91f6bac3e-1 form=unit
func lastIndexOf(b: Byte): Option<Int64>
func lastIndexOf(b: Byte, fromIndex: Int64): Option<Int64>
func lastIndexOf(str: String): Option<Int64>
func lastIndexOf(str: String, fromIndex: Int64): Option<Int64>
```

```cangjie cjtest=syntax id=syntax-d91f6bac3e-2 form=stmt
"abcabc".lastIndexOf("abc") // Some(3)
```
