<!-- cj-doc kind="guide-index" level="4" id="language.for.2-range-区间类型" parent="language.for" -->
# 2. Range 区间类型

[← for-in 与迭代](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [2.1 区间字面量](2-1-区间字面量.md) | 半开区间（左闭右开）：`start..end` — 不包含 `end` |
| [2.2 逆向与步长](2-2-逆向与步长.md) | `Range` 可指定非单位步长；使用负步长时起点必须大于终点，才能产生逆序序列。 |
| [2.3 空区间](2-3-空区间.md) | `step 0 && start = end`（半开）或 `step 0 && start end`（闭）→ 空区间，循环体不执行 |
| [2.4 Range 类型签名](2-4-range-类型签名.md) | `start: T`、`end: T`、`step: Int64` |
