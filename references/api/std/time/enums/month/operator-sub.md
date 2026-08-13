<!-- cj-doc kind="api-member" level="6" id="std.time.enum.month.operator-sub" parent="std.time.enum.month" -->
# Month.-

[← Month](index.md)

## 签名

```cangjie role=signature
public operator func -(n: Int64): Month
```

计算基于当前日历月份 `n` 个前之后（n 为正数时）的日历月份。

## 契约

功能：计算基于当前日历月份 `n` 个前之后（n 为正数时）的日历月份。若 `n` 为负数，则表示当月之后。

参数：

- n: Int64 - 前多少月的数量。

返回值：

- Month - `n` 月前的月份。
