<!-- cj-doc kind="guide-leaf" level="5" id="language.type_system.4-类型转换.4-3-rune-整数转换" parent="language.type_system.4-类型转换" -->
# 4.3 `Rune` ↔ 整数转换

[← 4. 类型转换](index.md)

- `UInt32(runeExpr)` — 返回 Unicode 标量值
- `Rune(intExpr)` — 仅当值在 `[0x0000, 0xD7FF]` 或 `[0xE000, 0x10FFFF]` 范围内有效；否则编译报错或运行时抛异常
