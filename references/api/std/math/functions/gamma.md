<!-- cj-doc kind="api-member" level="5" id="std.math.func.gamma" parent="std.math" -->
# gamma

[← std.math](../index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## gamma(Float16)

### 签名

```cangjie role=signature
public func gamma(x: Float16): Float16
```

求浮点数的伽马函数值，该函数是阶乘概念在实数上的推广，其求值公式为：

### 契约

$${\displaystyle \Gamma (x)=\int _{0}^{\infty }t^{x-1}\mathrm {e} ^{-t}{\rm {{d}t,}}}$$

参数：

- x: Float16 - 传入的需要求伽马函数值的半精度浮点数。

返回值：

- Float16 - 返回传入浮点数的伽马函数值。

## gamma(Float32)

### 签名

```cangjie role=signature
public func gamma(x: Float32): Float32
```

求浮点数的伽马函数值，该函数是阶乘概念在实数上的推广。

### 契约

参数：

- x: Float32 - 传入的需要求伽马函数值的单精度浮点数。

返回值：

- Float32 - 返回传入浮点数的伽马函数值。

## gamma(Float64)

### 签名

```cangjie role=signature
public func gamma(x: Float64): Float64
```

求浮点数的伽马函数值，该函数是阶乘概念在实数上的推广。

### 契约

参数：

- x: Float64 - 传入的需要求伽马函数值的双精度浮点数。

返回值：

- Float64 - 返回传入浮点数的伽马函数值。
