<!-- cj-doc kind="guide-index" level="4" id="language.string.7-分割" parent="language.string" -->
# 7. 分割

[← String](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [7.1 `split` — 按分隔符分割](7-1-split-按分隔符分割.md) | `maxSplits` 限制的是返回的子字符串数量，不是分隔动作次数：`0` 返回空数组，`1` 返回只含原字符串的数组，负数表示完整分割。 |
| [7.2 `lazySplit` — 惰性分割（返回迭代器）](7-2-lazysplit-惰性分割-返回迭代器.md) | 与 `split` 功能相同，但返回 `Iterator<String>`，适合处理大字符串时避免一次性分配 |
| [7.3 `lines` — 按行分割](7-3-lines-按行分割.md) | `func lines(): Iterator<String>`：按行分割。 |
