<!-- cj-doc kind="api-member" level="5" id="std.math.func.erf" parent="std.math" -->
# erf

[← std.math](../index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## erf(Float16)

### 签名

```cangjie role=signature
public func erf(x: Float16): Float16
```

求半精度浮点数的误差值。

### 契约

功能：求半精度浮点数的误差值。相关定义是：$$erf(x) = \frac{2}{\sqrt{\pi}}\int_0^xe^{-t^2}dt$$。

参数：

- x: Float16 - 传入的半精度浮点数。

返回值：

- Float16 - 返回传入参数的半精度浮点数的误差值。

## erf(Float32)

### 签名

```cangjie role=signature
public func erf(x: Float32): Float32
```

求单精度浮点数的误差值。

### 契约

功能：求单精度浮点数的误差值。相关定义是：$$erf(x) = \frac{2}{\sqrt{\pi}}\int_0^xe^{-t^2}dt$$。

参数：

- x: Float32 - 传入的单精度浮点数。

返回值：

- Float32 - 返回传入参数的单精度浮点数的误差值。

## erf(Float64)

### 签名

```cangjie role=signature
public func erf(x: Float64): Float64
```

求双精度浮点数的误差值。

### 契约

功能：求双精度浮点数的误差值。相关定义是：$$erf(x) = \frac{2}{\sqrt{\pi}}\int_0^xe^{-t^2}dt$$。

参数：

- x: Float64 - 传入的双精度浮点数。

返回值：

- Float64 - 返回传入参数的双精度浮点数的误差值。
