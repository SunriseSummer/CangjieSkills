<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.addhours" parent="std.time.struct.datetime" -->
# DateTime.addHours

[← DateTime](index.md)

## 签名

```cangjie role=signature
public func addHours(n: Int64): DateTime
```

获取 DateTime 实例 `n` 小时之后的时间，返回新的 DateTime 实例。

## 契约

参数：

- n: Int64 - 自 DateTime 实例后多少小时的数量。

返回值：

- DateTime - DateTime 实例 `n` 小时后的时间。

异常：

- ArithmeticException - DateTime 实例 `n` 小时后的日期时间超过表示范围时，抛出异常。
