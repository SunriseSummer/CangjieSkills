<!-- cj-doc kind="guide-leaf" level="5" id="language.string.13-转换.13-2-转为-rune-数组" parent="language.string.13-转换" -->
# 13.2 转为 Rune 数组

[← 13. 转换](index.md)

`func toRuneArray(): Array<Rune>`：转为 Rune 数组。

```cangjie cjtest=syntax id=syntax-d90eab9987-1 form=unit
func toRuneArray(): Array<Rune>
```

```cangjie cjtest=syntax id=syntax-d90eab9987-2 form=stmt
let runes = "Hi你".toRuneArray() // [r'H', r'i', r'你']
```
