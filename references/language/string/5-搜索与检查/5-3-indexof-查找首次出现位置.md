<!-- cj-doc kind="guide-leaf" level="5" id="language.string.5-搜索与检查.5-3-indexof-查找首次出现位置" parent="language.string.5-搜索与检查" -->
# 5.3 `indexOf` — 查找首次出现位置

[← 5. 搜索与检查](index.md)

`func indexOf(b: Byte): Option<Int64>`：查找首次出现位置。

```cangjie cjtest=syntax id=syntax-5cd191e547-1 form=unit
func indexOf(b: Byte): Option<Int64>
func indexOf(b: Byte, fromIndex: Int64): Option<Int64>
func indexOf(str: String): Option<Int64>
func indexOf(str: String, fromIndex: Int64): Option<Int64>
```

```cangjie cjtest=syntax id=syntax-5cd191e547-2 form=stmt
let s = "Hello World"
println(s.indexOf("World"))     // Some(6)
println(s.indexOf("xyz"))       // None
println(s.indexOf("l"))         // Some(2)
println(s.indexOf("l", 3))      // Some(3)  — 从索引 3 开始搜索
```
