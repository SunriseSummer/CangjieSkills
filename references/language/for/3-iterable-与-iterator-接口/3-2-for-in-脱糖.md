<!-- cj-doc kind="guide-leaf" level="5" id="language.for.3-iterable-与-iterator-接口.3-2-for-in-脱糖" parent="language.for.3-iterable-与-iterator-接口" -->
# 3.2 for-in 脱糖

[← 3. Iterable 与 Iterator 接口](index.md)

`for (item in source)` 会取得 `source.iterator()`，并反复调用 `next()`，直到迭代器返回 `None`。

```cangjie cjtest=syntax id=syntax-a45a713bc1-1 form=stmt
let list = [10, 20, 30]
for (i in list) { println(i) }
```
等价于：
```cangjie cjtest=syntax id=syntax-a45a713bc1-2 form=stmt
let list = [10, 20, 30]
var it = list.iterator()
while (let Some(i) <- it.next()) {
    println(i)
}
```
