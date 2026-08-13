<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.addmonths" parent="std.time.struct.datetime" -->
# DateTime.addMonths

[← DateTime](index.md)

## 签名

```cangjie role=signature
public func addMonths(n: Int64): DateTime
```

获取 DateTime 实例 `n` 月之后的时间，返回新的 DateTime 实例。

## 契约

> **注意：**
>
> 由于月的间隔不固定，若设 dt 表示 “2020 年 3 月 31 日”，`dt.addMonths(1)` 不会返回非法日期“2020 年 4 月 31 日”。为了尽量返回有效的日期，会偏移到当月最后一天，返回“2020 年 4 月 30 日”。

参数：

- n: Int64 - 自 DateTime 实例后多少月的数量。

返回值：

- DateTime - DateTime 实例 `n` 月后的时间。

异常：

- ArithmeticException - DateTime 实例 `n` 月后的日期时间超过表示范围时，抛出异常。
