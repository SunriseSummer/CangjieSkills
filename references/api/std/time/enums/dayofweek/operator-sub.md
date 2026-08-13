<!-- cj-doc kind="api-member" level="6" id="std.time.enum.dayofweek.operator-sub" parent="std.time.enum.dayofweek" -->
# DayOfWeek.-

[← DayOfWeek](index.md)

## 签名

```cangjie role=signature
public operator func -(n: Int64): DayOfWeek
```

计算基于当前实例 `n` 天之前（n 为正数时）的表示值。

## 契约

功能：计算基于当前实例 `n` 天之前（n 为正数时）的表示值。若 `n` 为负数，则表示当天之后。

参数：

- n: Int64 - 前多少天。

返回值：

- DayOfWeek - `n` 天前的周数值。
