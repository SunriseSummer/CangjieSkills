<!-- cj-doc kind="api-member" level="6" id="std.time.struct.datetime.inlocal" parent="std.time.struct.datetime" -->
# DateTime.inLocal

[← DateTime](index.md)

## 签名

```cangjie role=signature
public func inLocal(): DateTime
```

获取 DateTime 实例在本地时区的时间。

## 契约

返回值：

- DateTime - DateTime 实例在本地时区的时间。

异常：

- ArithmeticException - 当返回的 DateTime 实例表示的日期时间超过表示范围时，抛出异常。
