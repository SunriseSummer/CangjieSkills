<!-- cj-doc kind="guide-index" level="4" id="language.option.5-解构方式" parent="language.option" -->
# 5. 解构方式

[← Option](../index.md)

| 细粒度主题 | 摘要 |
|---|---|
| [5.1 模式匹配（match）](5-1-模式匹配-match.md) | 使用 `match` 对 `Option` 值进行解构。 |
| [5.2 coalescing 操作符 `??`](5-2-coalescing-操作符.md) | `e1 ?? e2`：当 `e1` 为 `Some(v)` 时返回 `v`，否则返回 `e2`。 |
| [5.3 问号操作符 `?.`](5-3-问号操作符.md) | 问号操作符与成员访问、调用、下标或尾随 Lambda 连用；遇到 `None` 时短路并返回对应的 `None`。 |
| [5.4 `getOrThrow()`](5-4-getorthrow.md) | `getOrThrow()` 解构 `?T` 表达式：值为 `Some(v)` 时返回 `v`，为 `None` 时抛出 `NoneValueException`。 |
