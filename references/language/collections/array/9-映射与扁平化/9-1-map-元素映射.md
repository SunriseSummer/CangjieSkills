<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.array.9-映射与扁平化.9-1-map-元素映射" parent="language.collections.array.9-映射与扁平化" -->
# 9.1 `map` — 元素映射

[← 9. 映射与扁平化](index.md)

`func map<R>(transform: (T) -> R): Array<R>`：元素映射。

```cangjie cjtest=syntax id=syntax-b14129fdb5-1 form=unit
func map<R>(transform: (T) -> R): Array<R>
```

```cangjie cjtest=syntax id=syntax-b14129fdb5-2 form=stmt
let arr = [1, 2, 3]
let strs = arr.map { v => v.toString() }  // ["1", "2", "3"]
let doubled = arr.map { v => v * 2 }      // [2, 4, 6]
```
