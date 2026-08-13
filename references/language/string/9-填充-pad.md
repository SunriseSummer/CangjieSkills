<!-- cj-doc kind="guide-leaf" level="4" id="language.string.9-填充-pad" parent="language.string" -->
# 9. 填充（Pad）

[← String](index.md)

```cangjie cjtest=syntax id=syntax-070a620862-1 form=unit
func padStart(totalWidth: Int64, padding!: String = " "): String
func padEnd(totalWidth: Int64, padding!: String = " "): String
```

- `totalWidth` 为目标字节宽度
- 如果原字符串长度已 ≥ `totalWidth`，返回原字符串

```cangjie cjtest=syntax id=syntax-070a620862-2 form=stmt
"42".padStart(6)           // "    42"
"42".padStart(6, padding: "0") // "000042"
"42".padEnd(6)             // "42    "
"42".padEnd(6, padding: ".")  // "42...."
```

---
