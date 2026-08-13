<!-- cj-doc kind="api-type" level="5" id="std.core.interface.countable" parent="std.core" -->
# Countable<T>

[← std.core](../../index.md)

`Countable<T>`

该接口表示类型可数。

## 方法

| 签名 | 功能 |
|---|---|
| [`next(right: Int64): T`](next.md) | 获取当前实例向右移动 `right` 后对应位置的 `T` 类型实例。 |
| [`position(): Int64`](position.md) | 获取当前可数实例的位置信息，即将当前实例转为 Int64 类型。 |

## 跨扩展成员

| 签名 | 功能 |
|---|---|
| [`operator *(r: Duration): Duration`](operator-mul.md) | 实现 Float64 类型和 Duration 类型的乘法，即 Float64 * Duration 运算。 |

## 扩展实现

| 扩展声明 | 功能 |
|---|---|
| [`extend Float64`](extensions/extend-float64.md) | 拓展了 Float64 类型作为左操作数和 Duration 类型作为右操作数的乘法运算。 |
| [`extend Int64`](extensions/extend-int64.md) | 拓展了 Int64 类型作为左操作数和 Duration 类型作为右操作数的乘法运算。 |
