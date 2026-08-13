<!-- cj-doc kind="guide-leaf" level="5" id="language.string.8-裁剪-trim.8-1-ascii-空白裁剪" parent="language.string.8-裁剪-trim" -->
# 8.1 ASCII 空白裁剪

[← 8. 裁剪（Trim）](index.md)

`func trimAscii(): String       // 两端裁剪 ASCII 空白`：ASCII 空白裁剪。

```cangjie cjtest=syntax id=syntax-300a81e7b2-1 form=unit
func trimAscii(): String       // 两端裁剪 ASCII 空白
func trimAsciiStart(): String  // 裁剪前导 ASCII 空白
func trimAsciiEnd(): String    // 裁剪尾部 ASCII 空白
```

```cangjie cjtest=syntax id=syntax-300a81e7b2-2 form=stmt
"  hello  ".trimAscii()      // "hello"
"  hello  ".trimAsciiStart() // "hello  "
"  hello  ".trimAsciiEnd()   // "  hello"
```
