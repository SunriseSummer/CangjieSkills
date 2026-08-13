<!-- cj-doc kind="example-category" level="3" id="examples.time" parent="examples" -->
# 日期与时间

[← 应用示例](../index.md)

用 DateTime 处理日历时间与格式化输入，用 MonoTime 测量不受系统时钟校准影响的经过时间。

| 示例 | 教学目标 |
|---|---|
| [按格式解析 DateTime](datetime-parse.md) | 让输入与格式模板逐项对应，并捕获 TimeParseException 处理非法日期。 |
| [用 MonoTime 测量经过时间](monotime-elapsed.md) | 在操作前后读取 `MonoTime.now()` 并相减得到 Duration；不要用可被系统校准的 DateTime 统计耗时。 |
