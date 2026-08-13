<!-- cj-doc kind="api-member" level="6" id="std.core.struct.duration.tomilliseconds" parent="std.core.struct.duration" -->
# Duration.toMilliseconds

[← Duration](index.md)

## 签名

```cangjie role=signature
public func toMilliseconds(): Int64
```

获得当前 Duration 实例以毫秒为单位的整数大小。

## 契约

返回值：

- Int64 - 当前 Duration 实例以毫秒为单位的大小。

异常：

- ArithmeticException - 当 Duration 实例以毫秒为单位的大小超过 Int64 表示范围时，抛出异常。
