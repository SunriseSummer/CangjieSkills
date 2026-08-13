<!-- cj-doc kind="guide-leaf" level="4" id="language.option.4-显式-none" parent="language.option" -->
# 4. 显式 `None<T>`

[← Option](index.md)

无上下文类型信息时，使用 `None<T>` 显式指定类型：
```cangjie cjtest=syntax id=syntax-b81c51490d-1 form=stmt
let a = None<Int64>   // a: Option<Int64>
let b = None<Bool>    // b: Option<Bool>
```

---
