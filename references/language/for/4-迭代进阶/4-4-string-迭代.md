<!-- cj-doc kind="guide-leaf" level="5" id="language.for.4-迭代进阶.4-4-string-迭代" parent="language.for.4-迭代进阶" -->
# 4.4 String 迭代

[← 4. 迭代进阶](index.md)

**注意** String 只实现了 `Iterable<Byte>`，**逐字节而不是逐字符**迭代：

```cangjie cjtest=syntax id=syntax-ed08b15d2a-1 form=stmt
for (ch in "Hi仓颉") {
    println(ch)  // 逐个输出：72 105 228 187 147 233 162 137
}
```

如果需要逐字符（Rune）迭代，请使用 `runes()` 方法获取 `Iterator<Rune>`：

```cangjie cjtest=syntax id=syntax-ed08b15d2a-2 form=stmt
for (ch in "Hi仓颉".runes()) {
    println(ch)  // 逐个输出：H i 仓 颉
}
```

> 也可以用 `toRuneArray()` 转为 `Array<Rune>` 后再迭代，但 `runes()` 返回迭代器，避免额外的数组分配，是更推荐的方式。

---
