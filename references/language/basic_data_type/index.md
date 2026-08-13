<!-- cj-doc kind="guide-topic" level="3" id="language.basic_data_type" parent="language" -->
# 基本数据类型

[← 语言特性](../index.md)

数值、Bool、Rune、String、Unit、Nothing、元组、数组、区间与运算符。

| 规则/任务 | 摘要 |
|---|---|
| [概述与共同规则](overview.md) | 注意：这些基础数据类型都实现了 ToString 接口，都可以直接打印或用于插值字符串，也可以调用`toString`成员函数显式转`String`类型 |
| [1. 整数类型](1-整数类型/index.md) | 示例：`100i8`、`0x10u64`、`0o432i32` |
| [2. 浮点类型](2-浮点类型/index.md) | 注意只有以上三种后缀，没有 f 后缀 |
| [3. 布尔类型](3-布尔类型.md) | `Bool` 只有 `true` 和 `false` 两个值，用于条件表达式及逻辑运算。 |
| [4. 字符类型（Rune）](4-字符类型-rune/index.md) | `Rune` 表示 Unicode 标量；字面量必须带 `r` 前缀，如 `r'a'` 或 `r"你"`，普通单引号字面量仍是 `String`。 |
| [5. 字符串类型](5-字符串类型/index.md) | 类型：`String`，Unicode 字符序列 |
| [6. Unit 类型](6-unit-类型.md) | `Unit` 表示没有有意义的返回值，其唯一值写作 `()`。 |
| [7. Nothing 类型](7-nothing-类型.md) | `Nothing` 不含任何值且是所有类型的子类型；`break`、`continue`、`return`、`throw` 表达式都具有该类型。 |
| [8. 元组类型](8-元组类型/index.md) | 元组类型写作 `(T1, T2, ...)`，值写作 `(v1, v2, ...)`；固定长度且元素不可写。用编译期整数下标 `tuple[0]` 访问，不使用其他语言的 `.0`/`.1` 语法。 |
| [9. 数组类型](9-数组类型/index.md) | 有序、单元素类型集合，固定长度（不支持增删） |
| [10. 区间类型（Range）](10-区间类型-range/index.md) | 泛型类型：`Range<T>`（T 须支持关系运算和与 `Int64` 的加法） |
| [11. 基本运算符](11-基本运算符/index.md) | `=`、`*=`、`/=`、`%=`、`+=`、`-=`、`<<=`、`>>=`、`&=`、`^=`、`\|=`、`&&=`、`\|\|=` |
