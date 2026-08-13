<!-- cj-doc kind="guide-leaf" level="5" id="language.option.5-解构方式.5-4-getorthrow" parent="language.option.5-解构方式" -->
# 5.4 `getOrThrow()`

[← 5. 解构方式](index.md)

`getOrThrow()` 解构 `?T` 表达式：值为 `Some(v)` 时返回 `v`，为 `None` 时抛出 `NoneValueException`。
```cangjie cjtest=syntax id=syntax-620ca03c29-1 form=unit
main() {
    let a = Some(1)
    let r1 = a.getOrThrow()   // 1

    let b: ?Int64 = None
    try {
        let r2 = b.getOrThrow()
    } catch (e: NoneValueException) {
        println("b is None")   // 输出: b is None
    }
}
```

---
