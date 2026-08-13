<!-- cj-doc kind="guide-leaf" level="5" id="language.pattern_match.1-match-表达式.1-2-无匹配值的-match" parent="language.pattern_match.1-match-表达式" -->
# 1.2 无匹配值的 match

[← 1. match 表达式](index.md)

每个 `case` 接受 `Bool` 表达式（非模式），`_` 表示 `true`，不支持模式守卫：

```cangjie cjtest=syntax id=syntax-9696e3d1a7-1 form=stmt
let x = -1
match {
    case x > 0 => print("positive")
    case x < 0 => print("negative")  // 匹配
    case _ => print("zero")
}
```
