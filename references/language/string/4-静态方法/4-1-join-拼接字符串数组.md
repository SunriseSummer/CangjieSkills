<!-- cj-doc kind="guide-leaf" level="5" id="language.string.4-静态方法.4-1-join-拼接字符串数组" parent="language.string.4-静态方法" -->
# 4.1 `join` — 拼接字符串数组

[← 4. 静态方法](index.md)

`static func join(strArr: Array<String>, delimiter!: String = String.empty): String`：拼接字符串数组。

```cangjie cjtest=syntax id=syntax-3c50a15554-1 form=unit
static func join(strArr: Array<String>, delimiter!: String = String.empty): String
```

```cangjie cjtest=syntax id=syntax-3c50a15554-2 form=stmt
let arr = ["I", "like", "Cangjie"]
let s = String.join(arr, delimiter: " ")
println(s) // "I like Cangjie"

let csv = String.join(["a", "b", "c"], delimiter: ",")
println(csv) // "a,b,c"
```
