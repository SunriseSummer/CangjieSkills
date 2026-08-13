<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.ofepoch" parent="std.time.struct.datetime" -->
# DateTime.ofEpoch

[← DateTime](index.md)

## 签名

```cangjie role=signature
public static func ofEpoch(second!: Int64, nanosecond!: Int64): DateTime
```

根据入参 `second` 和 `nanosecond` 构造 DateTime 实例。

## 契约

功能：根据入参 `second` 和 `nanosecond` 构造 DateTime 实例。入参 `second` 表示 unix 时间的秒部分，`nanosecond` 表示 unix 时间的纳秒部分。unix 时间以 UnixEpoch 开始计算，`nanosecond` 的范围不可以超过 [0, 999,999,999]，否则抛出异常。

参数：

- second!: Int64 - unix 时间的秒部分。
- nanosecond!: Int64 - unix 时间的纳秒部分，范围不可以超过 [0, 999,999,999]。

返回值：

- DateTime - 自 UnixEpoch 开始，指定 `second` 和 `nanosecond` 后的时间。

异常：

- IllegalArgumentException - 当 `nanosecond` 值超出指定范围时，抛出异常。
- ArithmeticException - 当结果超过日期时间的表示范围时，抛出异常。
