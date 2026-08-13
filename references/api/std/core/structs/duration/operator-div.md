<!-- cj-doc kind="api-member" level="6" id="std.core.struct.duration.operator-div" parent="std.core.struct.duration" -->
# Duration./

[← Duration](index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## operator func /(Duration)

### 签名

```cangjie role=signature
public operator func /(r: Duration): Float64
```

实现 Duration 类型与 Duration 类型的除法，即 Duration / Duration 运算。

### 契约

参数：

- r: Duration - 除数。

返回值：

- Float64 - Duration 类型实例和 `r` 的商。

异常：

- IllegalArgumentException - 当 `r` 等于 Duration.Zero 时，抛出异常。

## operator func /(Float64)

### 签名

```cangjie role=signature
public operator func /(r: Float64): Duration
```

实现 Duration 类型与 Float64 类型的除法，即 Duration / Float64 运算。

### 契约

参数：

- r: Float64 - 除数。

返回值：

- Duration - Duration 类型实例和 `r` 的商。

异常：

- IllegalArgumentException - 当 `r` 等于 0 时，抛出异常。
- ArithmeticException - 当相除后的结果超出 Duration 的表示范围时，抛出异常。

## operator func /(Int64)

### 签名

```cangjie role=signature
public operator func /(r: Int64): Duration
```

实现 Duration 类型与 Int64 类型的除法，即 Duration / Int64 运算。

### 契约

参数：

- r: Int64 - 除数。

返回值：

- Duration - Duration 类型实例和 `r` 的商。

异常：

- IllegalArgumentException - 当 `r` 等于 0 时，抛出异常。
- ArithmeticException - 当相除后的结果超出 Duration 的表示范围时，抛出异常。
