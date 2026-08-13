<!-- cj-doc kind="guide-leaf" level="5" id="language.pattern_match.1-match-表达式.1-3-模式守卫-where" parent="language.pattern_match.1-match-表达式" -->
# 1.3 模式守卫（`where`）

[← 1. match 表达式](index.md)

模式后添加 `where condition`（`Bool` 类型），case 仅在模式匹配**且**守卫为 `true` 时匹配。**注意**：仓颉使用 `where`，而非 `if`：

```cangjie cjtest=syntax id=syntax-d7108b1450-1 form=unit
enum RGBColor {
    | Red(Int16) | Green(Int16) | Blue(Int16)
}

main() {
    let c = RGBColor.Green(-100)
    let cs = match (c) {
        case Green(g) where g < 0 => "Green = 0"  // 匹配
        case Green(g) => "Green = ${g}"
        case Red(r) where r < 0 => "Red = 0"
        case Red(r) => "Red = ${r}"
        case Blue(b) where b < 0 => "Blue = 0"
        case Blue(b) => "Blue = ${b}"
    }
    println(cs)  // Green = 0
}
```
