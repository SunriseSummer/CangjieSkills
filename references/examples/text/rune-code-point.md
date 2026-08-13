<!-- cj-doc kind="example-leaf" level="4" id="examples.text.rune-code-point" parent="examples.text" -->
# 按 Unicode 字符处理文本与码点

[← 字符串、正则与文本解析](index.md)

用 r 前缀书写 Rune、用 runes() 按字符迭代；比较可直接进行，算术须先转换为 UInt32。

## 已验证的 Rune 与码点处理

`Rune` 字面量必须带 `r` 前缀；`r'7'` 是字符，而普通 `'7'` 是 `String`。字符串默认按 UTF-8 字节迭代，需要按 Unicode 字符处理时调用 `runes()`。Rune 支持比较但不支持算术；先用 `UInt32` 取得 Unicode 标量值，计算后再用 `Rune` 转回。

下面的完整程序识别十进制数字、推进一个 ASCII 码点，并证明非 ASCII 字符只作为一个 Rune 参与迭代：

```cangjie cjtest=run id=examples.text.rune-code-point.language.rune-code-point.run form=unit timeout=20s
package rune_code_point

func decimalDigit(value: Rune): UInt32 {
    if (value < r'0' || value > r'9') {
        throw Exception("not a decimal digit")
    }
    return UInt32(value) - UInt32(r'0')
}

main(): Unit {
    println(decimalDigit(r'7'))
    println(Rune(UInt32(r'A') + 1))

    var runeCount: Int64 = 0
    for (_ in "A你9".runes()) {
        runeCount += 1
    }
    println(runeCount)
}
```

预期标准输出：

```text cjtest=expect for=examples.text.rune-code-point.language.rune-code-point.run stream=stdout match=exact
7
B
3
```
