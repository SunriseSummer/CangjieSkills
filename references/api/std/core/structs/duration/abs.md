<!-- cj-doc kind="api-member" level="6" id="std.core.struct.duration.abs" parent="std.core.struct.duration" -->
# Duration.abs

[← Duration](index.md)

## 签名

```cangjie role=signature
public func abs(): Duration
```

返回一个新的 Duration 实例，其值大小为当前 Duration 实例绝对值。

## 契约

返回值：

- Duration - 当前 Duration 实例取绝对值的结果。

异常：

- ArithmeticException - 如果当前 Duration 实例等于 Duration.Min，会因为取绝对值超出 Duration 表示范围而抛出异常。
