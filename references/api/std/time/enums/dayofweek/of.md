<!-- cj-doc kind="api-member" level="6" id="std.time.enum.dayofweek.of" parent="std.time.enum.dayofweek" -->
# DayOfWeek.of

[← DayOfWeek](index.md)

## 签名

```cangjie role=signature
public static func of(dayOfWeek: Int64): DayOfWeek
```

获取参数 `dayOfWeek` 对应的 DayOfWeek 实例。

## 契约

参数：

- dayOfWeek: Int64 - 周几的整数表示，合法范围为 [0, 6]。其中，0 表示周日，1 至 6 表示周一至周六。

返回值：

- DayOfWeek - 参数 `dayOfWeek` 对应的 DayOfWeek 实例。

异常：

- IllegalArgumentException - 当参数 `dayOfWeek` 不在 [0, 6] 范围内时，抛出异常。
