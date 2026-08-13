<!-- cj-doc kind="api-member" level="6" id="std.core.struct.duration.tonanoseconds" parent="std.core.struct.duration" -->
# Duration.toNanoseconds

[← Duration](index.md)

## 签名

```cangjie role=signature
public func toNanoseconds(): Int64
```

获得当前 Duration 实例以纳秒为单位的整数大小，向绝对值小的方向取整。

## 契约

返回值：

- Int64 - 当前 Duration 实例以纳秒为单位的大小。

异常：

- ArithmeticException - 当 Duration 实例以“纳秒”为单位的大小超过 Int64 表示范围时，抛出异常。
