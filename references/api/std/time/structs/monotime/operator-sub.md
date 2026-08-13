<!-- cj-doc kind="api-member" level="6" id="std.time.struct.monotime.operator-sub" parent="std.time.struct.monotime" -->
# MonoTime.-

[← MonoTime](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## operator func -(Duration)

### 签名

```cangjie role=signature
public operator func -(r: Duration): MonoTime
```

实现 MonoTime 类型和 Duration 类型减法，即 MonoTime - Duration 运算。

### 契约

参数：

- r: Duration - 时间间隔。

返回值：

- MonoTime - 参数 `r` 表示时间间隔前的单调时间。

异常：

- ArithmeticException - 当结果超过单调时间的表示范围时，抛出异常。

## operator func -(MonoTime)

### 签名

```cangjie role=signature
public operator func -(r: MonoTime): Duration
```

实现 MonoTime 类型之间的减法，即 MonoTime - MonoTime 运算。

### 契约

参数：

- r: MonoTime - 单调时间。

返回值：

- Duration - 当前实例距 `r` 经过的时间间隔。
