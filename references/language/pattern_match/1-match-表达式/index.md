<!-- cj-doc kind="guide-index" level="4" id="language.pattern_match.1-match-表达式" parent="language.pattern_match" -->
# 1. match 表达式

[← 模式匹配](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [1.1 有匹配值的 match](1-1-有匹配值的-match.md) | `match (value)` 按顺序选择首个匹配的 `case`；分支写 `case pattern => exprs`，多条语句直接换行且最后一条是分支值，不能在 `=>` 后加 `{}`；须穷举或用 `_` 兜底。 |
| [1.2 无匹配值的 match](1-2-无匹配值的-match.md) | 每个 `case` 接受 `Bool` 表达式（非模式），`_` 表示 `true`，不支持模式守卫。 |
| [1.3 模式守卫（`where`）](1-3-模式守卫-where.md) | 模式后添加 `where condition`（`Bool` 类型），case 仅在模式匹配且守卫为 `true` 时匹配。 |
| [1.4 match 表达式类型](1-4-match-表达式类型.md) | 有上下文类型：每个分支体须为期望类型的子类型 |
