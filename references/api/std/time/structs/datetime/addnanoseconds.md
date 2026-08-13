<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.addnanoseconds" parent="std.time.struct.datetime" -->
# DateTime.addNanoseconds

[← DateTime](index.md)

## 签名

```cangjie role=signature
public func addNanoseconds(n: Int64): DateTime
```

获取 DateTime 实例 `n` 纳秒之后的时间，返回新的 DateTime 实例。

## 契约

参数：

- n: Int64 - 自 DateTime 实例后多少纳秒的数量。

返回值：

- DateTime - DateTime 实例 `n` 纳秒后的时间。

异常：

- ArithmeticException - DateTime 实例 `n` 纳秒后时间的日期时间超过表示范围时，抛出异常。
