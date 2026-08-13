<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.addweeks" parent="std.time.struct.datetime" -->
# DateTime.addWeeks

[← DateTime](index.md)

## 签名

```cangjie role=signature
public func addWeeks(n: Int64): DateTime
```

获取 DateTime 实例 `n` 周之后的时间，返回新的 DateTime 实例。

## 契约

参数：

- n: Int64 - 自 DateTime 实例后多少周的数量。

返回值：

- DateTime - DateTime 实例 `n` 周后的时间。

异常：

功能：获取入参 n 周之后的时间，返回新的 DateTime 实例。
