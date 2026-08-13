<!-- cj-doc kind="guide-index" level="4" id="language.basic_data_type.5-字符串类型" parent="language.basic_data_type" -->
# 5. 字符串类型

[← 基本数据类型](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [概述与共同规则](overview.md) | 类型：`String`，Unicode 字符序列 |
| [5.1 三类字面量](5-1-三类字面量.md) | 单行字符串：用 `'...'` 或 `"..."` 包围。 |
| [5.2 隐式转换](5-2-隐式转换.md) | 当左侧为 `Byte`（`UInt8` 别名）且右侧为 ASCII 字符串字面量时，可隐式转换为 `Byte` |
| [5.3 字符串插值](5-3-字符串插值.md) | 语法：`"text ${expression} text"` |
| [5.4 支持的运算](5-4-支持的运算.md) | 字符串支持拼接、相等和字典序比较；关系运算符按字符序列比较两个字符串。 |
| [5.5 字符串迭代](5-5-字符串迭代.md) | `for (c in s)` 迭代的是字节（`UInt8`/`Byte`），因为 `String` 实现了 `Collection<Byte>`（UTF-8 编码字节序列） |
