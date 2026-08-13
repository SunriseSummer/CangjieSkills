<!-- cj-doc kind="api-type" level="5" id="std.core.intrinsic.rune" parent="std.core" -->
# Rune

[← std.core](../../index.md)

Unicode 字符标量类型；字面量必须带 `r` 前缀，如 `r'a'`，而普通 `'a'` 是 `String`。Rune 只支持关系比较；码点算术先用 `UInt32(rune)` 转换，结果用 `Rune(integer)` 转回。

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Rune`](extensions/extend-rune.md) | 为 Rune 类型实现一系列扩展方法，主要为在 Ascii 字符集范围内的一些字符判断、转换等操作。 |
| [`extend Rune <: Comparable<Rune>`](extensions/extend-rune-comparable-rune.md) | 为 Rune 类型扩展 Comparable<Rune> 接口，支持比较操作。 |
| [`extend Rune <: Countable<Rune>`](extensions/extend-rune-countable-rune.md) | 为 Rune 类型扩展 Countable<Rune> 接口，支持计数操作。 |
| [`extend Rune <: Hashable`](extensions/extend-rune-hashable.md) | 为 Rune 类型扩展 Hashable 接口，支持计算哈希值。 |
| [`extend Rune <: ToString`](extensions/extend-rune-tostring.md) | 这里为 Rune 类型扩展 ToString 接口，实现向 String 类型的转换。 |
