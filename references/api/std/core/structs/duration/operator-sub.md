<!-- cj-doc kind="api-member" level="6" id="std.core.struct.duration.operator-sub" parent="std.core.struct.duration" -->
# Duration.-

[← Duration](index.md)

## 签名

```cangjie role=signature
public operator func -(r: Duration): Duration
```

实现 Duration 类型之间的减法，即 Duration - Duration 运算。

## 契约

参数：

- r: Duration - 减法的右操作数。

返回值：

- Duration - Duration 类型实例和 `r` 的差。

异常：

- ArithmeticException - 当相减后的结果超出 Duration 的表示范围时，抛出异常。
