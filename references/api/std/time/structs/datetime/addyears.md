<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.addyears" parent="std.time.struct.datetime" -->
# DateTime.addYears

[← DateTime](index.md)

## 签名

```cangjie role=signature
public func addYears(n: Int64): DateTime
```

获取 DateTime 实例 `n` 年之后的时间，返回新的 DateTime 实例。

## 契约

> **注意：**
>
> 由于年的间隔不固定，若设 dt 表示 “2020 年 2 月 29 日”，`dt.addYears(1)` 不会返回非法日期“2021 年 2 月 29 日”。为了尽量返回有效的日期，会偏移到当月最后一天，返回 “2021 年 2 月 28 日”。

参数：

- n: Int64 - 自 DateTime 实例后多少年的数量。

返回值：

- DateTime - DateTime 实例 `n` 年后的时间。

异常：

- ArithmeticException - DateTime 实例 `n` 年后的日期时间超过表示范围时，抛出异常。
