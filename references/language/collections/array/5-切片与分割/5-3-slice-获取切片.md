<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.array.5-切片与分割.5-3-slice-获取切片" parent="language.collections.array.5-切片与分割" -->
# 5.3 `slice` — 获取切片

[← 5. 切片与分割](index.md)

`func slice(start: Int64, len: Int64): Array<T>`：获取切片。

```cangjie cjtest=syntax id=syntax-b539b056e5-1 form=unit
func slice(start: Int64, len: Int64): Array<T>
```

```cangjie cjtest=syntax id=syntax-b539b056e5-2 form=stmt
let arr = [0, 1, 2, 3, 4]
let s = arr.slice(1, 3) // [1, 2, 3]（从索引 1 开始取 3 个元素，引用）
```
