<!-- cj-doc kind="guide-index" level="4" id="language.type_system.4-类型转换" parent="language.type_system" -->
# 4. 类型转换

[← 类型系统](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [4.1 无隐式转换](4-1-无隐式转换.md) | 仓颉无隐式类型转换（子类型到父类型不被视为"转换"） |
| [4.2 数值转换](4-2-数值转换.md) | `T(e)` 其中 `T` 和 `e` 为任意数值类型（`Int8`/`Int16`/`Int32`/`Int64`/`IntNative`/`UInt8`/`UInt16`/`UInt32`/`UInt64`/`UIntNative`/`Float16`/`Float32`/`Float64`） |
| [4.3 `Rune` ↔ 整数转换](4-3-rune-整数转换.md) | `UInt32(runeExpr)` — 返回 Unicode 标量值 |
| [4.4 `is` 运算符](4-4-is-运算符.md) | `e is T` → `Bool`。 |
| [4.5 `as` 运算符](4-5-as-运算符.md) | `e as T` → `Option<T>`。 |
