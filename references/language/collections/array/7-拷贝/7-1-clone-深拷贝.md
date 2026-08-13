<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.array.7-拷贝.7-1-clone-深拷贝" parent="language.collections.array.7-拷贝" -->
# 7.1 `clone` — 深拷贝

[← 7. 拷贝](index.md)

`func clone(): Array<T>`：深拷贝。

```cangjie cjtest=syntax id=syntax-98f2819048-1 form=unit
func clone(): Array<T>
func clone(range: Range<Int64>): Array<T>
```

```cangjie cjtest=syntax id=syntax-98f2819048-2 form=stmt
let arr = [1, 2, 3]
let copy = arr.clone()        // [1, 2, 3]，独立副本
let partial = arr.clone(1..3) // [2, 3]
```
