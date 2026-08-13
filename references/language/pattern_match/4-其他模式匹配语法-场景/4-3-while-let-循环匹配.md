<!-- cj-doc kind="guide-leaf" level="5" id="language.pattern_match.4-其他模式匹配语法-场景.4-3-while-let-循环匹配" parent="language.pattern_match.4-其他模式匹配语法-场景" -->
# 4.3 while-let 循环匹配

[← 4. 其他模式匹配语法/场景](index.md)

在 `while` 条件中使用 `let pattern <- expression`，匹配成功时执行循环体，失败时退出循环。条件规则与 if-let 相同。

```cangjie cjtest=syntax id=syntax-5160944b97-1 form=unit
enum State {
    | Active(Int64) | Done
}

main() {
    var s: State = Active(1)
    while (let Active(n) <- s) {
        println(n)
        s = if (n < 3) { Active(n + 1) } else { Done }
    }
    // 输出：1 2 3
}
```

等价的 match 解糖形态：
```cangjie cjtest=syntax id=syntax-5160944b97-2 form=unit
enum State {
    | Active(Int64) | Done
}

main() {
    var s: State = Active(1)
    while (true) {
        match (s) {
            case Active(n) =>
                println(n)
                s = if (n < 3) { Active(n + 1) } else { Done }
            case _ => break
        }
    }
}
```

---
