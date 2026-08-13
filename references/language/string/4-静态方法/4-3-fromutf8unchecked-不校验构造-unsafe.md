<!-- cj-doc kind="guide-leaf" level="5" id="language.string.4-静态方法.4-3-fromutf8unchecked-不校验构造-unsafe" parent="language.string.4-静态方法" -->
# 4.3 `fromUtf8Unchecked` — 不校验构造（unsafe）

[← 4. 静态方法](index.md)

```cangjie cjtest=syntax id=syntax-1cc691389a-1 form=unit
static func fromUtf8Unchecked(utf8Data: Array<UInt8>): String
```

- 不校验 UTF-8 合法性，性能更好但使用不当会导致未定义行为
