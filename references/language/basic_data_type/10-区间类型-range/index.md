<!-- cj-doc kind="guide-index" level="4" id="language.basic_data_type.10-区间类型-range" parent="language.basic_data_type" -->
# 10. 区间类型（Range）

[← 基本数据类型](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [概述与共同规则](overview.md) | 泛型类型：`Range<T>`（T 须支持关系运算和与 `Int64` 的加法） |
| [10.1 区间字面量](10-1-区间字面量.md) | 半开区间（左闭右开）：`start..end : step` — 不包含 `end` |
| [10.2 空区间](10-2-空区间.md) | `start..end : step` 为空：当 `step 0 && start = end` 或 `step < 0 && start <= end` |
