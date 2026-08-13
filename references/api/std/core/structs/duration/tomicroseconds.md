<!-- cj-doc kind="api-member" level="6" id="std.core.struct.duration.tomicroseconds" parent="std.core.struct.duration" -->
# Duration.toMicroseconds

[← Duration](index.md)

## 签名

```cangjie role=signature
public func toMicroseconds(): Int64
```

获得当前 Duration 实例以微秒为单位的整数大小。

## 契约

返回值：

- Int64 - 当前 Duration 实例以微秒为单位的大小。

异常：

- ArithmeticException - 当 Duration 实例以微秒为单位的大小超过 Int64 表示范围时，抛出异常。
