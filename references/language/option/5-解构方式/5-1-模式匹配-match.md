<!-- cj-doc kind="guide-leaf" level="5" id="language.option.5-解构方式.5-1-模式匹配-match" parent="language.option.5-解构方式" -->
# 5.1 模式匹配（match）

[← 5. 解构方式](index.md)

使用 `match` 对 `Option` 值进行解构：
```cangjie cjtest=syntax id=syntax-1d0a1d3067-1 form=unit
func getString(p: ?Int64): String {
    match (p) {
        case Some(x) => "${x}"
        case None => "none"
    }
}

main() {
    println(getString(Some(1)))       // "1"
    println(getString(None<Int64>))   // "none"
}
```
