<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.array.6-拼接与重复.6-1-concat-拼接" parent="language.collections.array.6-拼接与重复" -->
# 6.1 `concat` — 拼接

[← 6. 拼接与重复](index.md)

`func concat(other: Array<T>): Array<T>`：拼接。

```cangjie cjtest=syntax id=syntax-d72533c27b-1 form=unit
func concat(other: Array<T>): Array<T>
```

```cangjie cjtest=syntax id=syntax-d72533c27b-2 form=stmt
let a = [1, 2]
let b = [3, 4]
let c = a.concat(b) // [1, 2, 3, 4]
```
