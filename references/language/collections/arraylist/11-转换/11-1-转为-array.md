<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.arraylist.11-转换.11-1-转为-array" parent="language.collections.arraylist.11-转换" -->
# 11.1 转为 Array

[← 11. 转换](index.md)

`func toArray(): Array<T>`：转为 Array。

```cangjie cjtest=syntax id=syntax-5296868ded-1 form=unit
func toArray(): Array<T>
```

```cangjie cjtest=syntax id=syntax-5296868ded-2 form=stmt
let list = ArrayList<Int64>([1, 2, 3])
let arr: Array<Int64> = list.toArray()  // [1, 2, 3]
```
