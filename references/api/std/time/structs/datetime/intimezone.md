<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.intimezone" parent="std.time.struct.datetime" -->
# DateTime.inTimeZone

[← DateTime](index.md)

## 签名

```cangjie role=signature
public func inTimeZone(timeZone: TimeZone): DateTime
```

获取 DateTime 实例在参数 `timeZone` 指定时区的时间。

## 契约

参数：

- timeZone: TimeZone - 目标时区。

返回值：

- DateTime - DateTime 实例在参数 `timezone` 指定时区的时间。

异常：

- ArithmeticException - 当返回的 DateTime 实例表示的日期时间超过表示范围时，抛出异常。
