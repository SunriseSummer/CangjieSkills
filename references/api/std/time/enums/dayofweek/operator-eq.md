<!-- cj-doc kind="api-member" level="6" id="std.time.enum.dayofweek.operator-eq" parent="std.time.enum.dayofweek" -->
# DayOfWeek.==

[← DayOfWeek](index.md)

## 签名

```cangjie role=signature
public operator func ==(r: DayOfWeek): Bool
```

判断当前 DayOfWeek 和 `r` 是否表示一周中的同一天。

## 契约

参数：

- r: DayOfWeek - DayOfWeek 实例。

返回值：

- Bool - `true` 或 `false`。当前 DayOfWeek 实例等于 `r` 时，返回 `true`；否则，返回 `false`。
