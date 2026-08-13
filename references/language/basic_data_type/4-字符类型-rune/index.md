<!-- cj-doc kind="guide-index" level="4" id="language.basic_data_type.4-字符类型-rune" parent="language.basic_data_type" -->
# 4. 字符类型（Rune）

[← 基本数据类型](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [概述与共同规则](overview.md) | 类型：`Rune`，表示所有 Unicode 字符 |
| [三种字面量形式](三种字面量形式.md) | Rune 字面量写作 `r'a'`、`r"b"`、转义形式或 `r'\u{4f60}'`；前缀 `r` 不能省略。 |
| [支持的运算](支持的运算.md) | Rune 可直接做关系比较，但不支持加减乘除；用 `UInt32(rune)` 取得 Unicode 标量值后运算，再以 `Rune(integer)` 转回。 |
