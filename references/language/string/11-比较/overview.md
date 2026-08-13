<!-- cj-doc kind="guide-leaf" level="5" id="language.string.11-比较.overview" parent="language.string.11-比较" -->
# 概述与共同规则

[← 11. 比较](index.md)

`func compare(other: String): Ordering   // 字典序比较，返回 Ordering.LT/EQ/GT`：概述与共同规则。

```cangjie cjtest=syntax id=syntax-34ff8edb55-1 form=unit
func compare(other: String): Ordering   // 字典序比较，返回 Ordering.LT/EQ/GT
func equalsIgnoreAsciiCase(other: String): Bool  // 忽略 ASCII 大小写比较
```

```cangjie cjtest=syntax id=syntax-34ff8edb55-2 form=stmt
"abc".compare("abd")                     // Ordering.LT
"Hello".equalsIgnoreAsciiCase("hello")   // true
```
