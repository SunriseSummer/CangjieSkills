<!-- cj-doc kind="api-member" level="6" id="std.core.interface.countable.operator-mul" parent="std.core.interface.countable" -->
# Countable<T>.*

[← Countable<T>](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## operator func *(Duration)

适用扩展：[extend Float64](extensions/extend-float64.md)。

### 签名

```cangjie role=signature
public operator func *(r: Duration): Duration
```

实现 Float64 类型和 Duration 类型的乘法，即 Float64 * Duration 运算。

### 契约

参数：

- r: Duration - Duration 实例。

返回值：

- Duration - Float64 类型实例和 `r` 的乘积。

异常：

- ArithmeticException - 当相乘后的结果超出 Duration 的表示范围时，抛出异常。

## operator func *(Duration)

适用扩展：[extend Int64](extensions/extend-int64.md)。

### 签名

```cangjie role=signature
public operator func *(r: Duration): Duration
```

实现 Int64 类型和 Duration 类型的乘法，即 Int64 * Duration 运算。

### 契约

例如 2 * Duration.second 返回表示时间间隔为 2 秒的 Duration 实例。

参数：

- r: Duration - 乘法的右操作数。

返回值：

- Duration - Int64 类型实例和 `r` 的乘积。

异常：

- ArithmeticException - 当相乘后的结果超出 Duration 的表示范围时，抛出异常。
