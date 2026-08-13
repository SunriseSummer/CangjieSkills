<!-- cj-doc kind="api-type" level="5" id="std.core.enum.ordering" parent="std.core" -->
# Ordering

[← std.core](../../index.md)

`Ordering`

Ordering 表示比较大小的结果，它包含三种情况：小于，大于和等于。

## 枚举值

| 签名 | 功能 |
|---|---|
| [`EQ`](value-eq.md) | 构造一个 Ordering 实例，表示等于。 |
| [`GT`](value-gt.md) | 构造一个 Ordering 实例，表示大于。 |
| [`LT`](value-lt.md) | 构造一个 Ordering 实例，表示小于。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Ordering <: Comparable<Ordering>`](extensions/extend-ordering-comparable.md) | 为 Ordering 类型其扩展 Comparable<Ordering> 接口，支持比较操作。 |
| [`extend Ordering <: Hashable`](extensions/extend-ordering-hashable.md) | 为 Ordering 类型其扩展 Hashable 接口，支持计算哈希值。 |
| [`extend Ordering <: ToString`](extensions/extend-ordering-tostring.md) | 为 Ordering 类型其扩展 ToString 接口，支持转字符串操作。 |
