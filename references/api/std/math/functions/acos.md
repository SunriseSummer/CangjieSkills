<!-- cj-doc kind="api-member" level="5" id="std.math.func.acos" parent="std.math" -->
# acos

[← std.math](../index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## acos(Float16)

### 签名

```cangjie role=signature
public func acos(x: Float16): Float16
```

计算半精度浮点数的反余弦函数值。

### 契约

参数：

- x: Float16 - 传入的半精度浮点数。-1.0 <= `x` <= 1.0。

返回值：

- Float16 - 返回传入参数的反余弦函数值，单位为弧度。

异常：

- IllegalArgumentException - 当参数 `x` 大于 1.0 或小于 -1.0 时，抛出异常。

## acos(Float32)

### 签名

```cangjie role=signature
public func acos(x: Float32): Float32
```

计算单精度浮点数的反余弦函数值。

### 契约

参数：

- x: Float32 - 传入的单精度浮点数。-1.0 <= `x` <= 1.0。

返回值：

- Float32 - 返回传入参数的反余弦函数值，单位为弧度。

异常：

- IllegalArgumentException - 当参数 `x` 大于 1.0 或小于 -1.0 时，抛出异常。

## acos(Float64)

### 签名

```cangjie role=signature
public func acos(x: Float64): Float64
```

计算双精度浮点数的反余弦函数值。

### 契约

参数：

- x: Float64 - 传入的双精度浮点数。-1.0 <= `x` <= 1.0。

返回值：

- Float64 - 返回传入参数的反余弦函数值，单位为弧度。

异常：

- IllegalArgumentException - 当参数 `x` 大于 1.0 或小于 -1.0 时，抛出异常。
