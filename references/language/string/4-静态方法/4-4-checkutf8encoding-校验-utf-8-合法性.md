<!-- cj-doc kind="guide-leaf" level="5" id="language.string.4-静态方法.4-4-checkutf8encoding-校验-utf-8-合法性" parent="language.string.4-静态方法" -->
# 4.4 `checkUtf8Encoding` — 校验 UTF-8 合法性

[← 4. 静态方法](index.md)

`static func checkUtf8Encoding(data: Array<UInt8>): Bool`：校验 UTF-8 合法性。

```cangjie cjtest=syntax id=syntax-333c09c603-1 form=unit
static func checkUtf8Encoding(data: Array<UInt8>): Bool
```

```cangjie cjtest=syntax id=syntax-333c09c603-2 form=stmt
let valid = String.checkUtf8Encoding([72, 101]) // true
let invalid = String.checkUtf8Encoding([0xFF, 0xFE]) // false
```

---
