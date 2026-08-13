<!-- cj-doc kind="guide-leaf" level="4" id="language.option.7-while-let-循环解构" parent="language.option" -->
# 7. while-let 循环解构

[← Option](index.md)

在 `while` 条件中使用 `let` 模式，常用于遍历迭代器：

```cangjie cjtest=syntax id=syntax-6b0915b9bf-1 form=unit
main() {
    let list = [1, 2, 3]
    var it = list.iterator()
    while (let Some(i) <- it.next()) {
        println(i) // 逐行输出 1 2 3
    }
}
```

等价的 `match` 写法，也即是 while-let 语法糖解糖后的形态：
```cangjie cjtest=syntax id=syntax-6b0915b9bf-2 form=stmt
let list = [1, 2, 3]
var it = list.iterator()
while (true) {
    match (it.next()) {
        case Some(i) => println(i)
        case None => break
    }
}
```

---
