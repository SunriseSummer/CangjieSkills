<!-- cj-doc kind="api-member" level="6" id="std.time.struct.monotime.operator-add" parent="std.time.struct.monotime" -->
# MonoTime.+

[← MonoTime](index.md)

## 签名

```cangjie role=signature
public operator func +(r: Duration): MonoTime
```

实现 MonoTime 类型和 Duration 类型加法，即 MonoTime + Duration 运算。

## 契约

参数：

- r: Duration - 时间间隔。

返回值：

- MonoTime - 参数 `r` 表示时间间隔后的单调时间。

异常：

- ArithmeticException - 当结果超过单调时间的表示范围时，抛出异常。
