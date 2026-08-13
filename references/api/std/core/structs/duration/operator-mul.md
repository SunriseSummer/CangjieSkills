<!-- cj-doc kind="api-member" level="6" id="std.core.struct.duration.operator-mul" parent="std.core.struct.duration" -->
# Duration.*

[← Duration](index.md)

本页汇总 2 个同名重载；先按签名选择，再读取对应契约。

## operator func *(Float64)

### 签名

```cangjie role=signature
public operator func *(r: Float64): Duration
```

实现 Duration 类型与 Float64 类型的乘法，即 Duration * Float64 运算。

### 契约

参数：

- r: Float64 - 乘法的右操作数。

返回值：

- Duration - Duration 类型实例和 `r` 的乘积。

异常：

- ArithmeticException - 当相乘后的结果超出 Duration 的表示范围时，抛出异常。

## operator func *(Int64)

### 签名

```cangjie role=signature
public operator func *(r: Int64): Duration
```

实现 Duration 类型与 Int64 类型的乘法，即 Duration * Int64 运算。

### 契约

参数：

- r: Int64 - 乘法的右操作数。

返回值：

- Duration - Duration 类型实例和 `r` 的乘积。

异常：

- ArithmeticException - 当相乘后的结果超出 Duration 的表示范围时，抛出异常。
