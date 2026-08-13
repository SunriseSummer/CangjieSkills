<!-- cj-doc kind="guide-leaf" level="6" id="language.collections.array.4-元素访问与修改.4-2-安全访问-get" parent="language.collections.array.4-元素访问与修改" -->
# 4.2 安全访问 `get`

[← 4. 元素访问与修改](index.md)

`func get(index: Int64): Option<T>`：安全访问 get。

```cangjie cjtest=syntax id=syntax-418ecb4979-1 form=unit
func get(index: Int64): Option<T>
```

```cangjie cjtest=syntax id=syntax-418ecb4979-2 form=stmt
let arr = [10, 20, 30]
println(arr.get(1))   // Some(20)
println(arr.get(10))  // None（不抛异常）
```
