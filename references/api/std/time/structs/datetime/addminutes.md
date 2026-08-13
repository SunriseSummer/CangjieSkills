<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.addminutes" parent="std.time.struct.datetime" -->
# DateTime.addMinutes

[← DateTime](index.md)

## 签名

```cangjie role=signature
public func addMinutes(n: Int64): DateTime
```

获取 DateTime 实例 `n` 分钟之后的时间，返回新的 DateTime 实例。

## 契约

参数：

- n: Int64 - 自 DateTime 实例后多少分钟的数量。

返回值：

- DateTime - DateTime 实例 `n` 分钟后的时间。

异常：

- ArithmeticException - DateTime 实例 `n` 分钟后的日期时间超过表示范围时，抛出异常。
