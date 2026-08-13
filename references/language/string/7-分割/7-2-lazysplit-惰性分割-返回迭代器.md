<!-- cj-doc kind="guide-leaf" level="5" id="language.string.7-分割.7-2-lazysplit-惰性分割-返回迭代器" parent="language.string.7-分割" -->
# 7.2 `lazySplit` — 惰性分割（返回迭代器）

[← 7. 分割](index.md)

```cangjie cjtest=syntax id=syntax-49c58575c0-1 form=unit
func lazySplit(str: String, removeEmpty!: Bool = false): Iterator<String>
func lazySplit(str: String, maxSplits: Int64, removeEmpty!: Bool = false): Iterator<String>
```

- 与 `split` 功能相同，但返回 `Iterator<String>`，适合处理大字符串时避免一次性分配
