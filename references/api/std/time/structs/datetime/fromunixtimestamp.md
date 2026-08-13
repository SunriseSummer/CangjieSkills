<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.fromunixtimestamp" parent="std.time.struct.datetime" -->
# DateTime.fromUnixTimeStamp

[← DateTime](index.md)

## 签名

```cangjie role=signature
public static func fromUnixTimeStamp(d: Duration): DateTime
```

获取自 UnixEpoch 开始，参数 `d` 指定时间间隔后的日期时间。

## 契约

参数：

- d: Duration - 时间间隔。

返回值：

- DateTime - 自 UnixEpoch 开始，指定 `d` 后的日期时间。

异常：

- ArithmeticException - 当结果超过日期时间的表示范围时，抛出异常。
