<!-- cj-doc kind="guide-leaf" level="5" id="language.basic_data_type.10-区间类型-range.overview" parent="language.basic_data_type.10-区间类型-range" -->
# 概述与共同规则

[← 10. 区间类型（Range）](index.md)

- 泛型类型：`Range<T>`（T 须支持关系运算和与 `Int64` 的加法）
- 包含 `start`、`end`（类型 T）、`step`（`Int64`，不能为 0）
- 构造函数：`Range<T>(start, end, step, hasStart, hasEnd, isClosed)`
