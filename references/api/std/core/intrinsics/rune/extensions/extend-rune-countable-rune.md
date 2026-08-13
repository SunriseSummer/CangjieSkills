<!-- cj-doc kind="api-extension" level="6" id="std.core.intrinsic.rune.extension.extend-rune-countable-rune" parent="std.core.intrinsic.rune" -->
# extend Rune <: Countable<Rune>

[← Rune](../index.md)

`extend Rune <: Countable<Rune>`

为 Rune 类型扩展 Countable<Rune> 接口，支持计数操作。

## 成员

| 签名 | 功能 |
|---|---|
| [`next(right: Int64): Rune`](../next.md) | 获取当前 Rune 值往右数 `right` 后所到位置的 Rune 值。 |
| [`position(): Int64`](../position.md) | 获取当前 Rune 值的位置信息，即将该 Rune 转换为 Int64 值。 |
