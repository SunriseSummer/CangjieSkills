<!-- cj-doc kind="api-member" level="5" id="std.math.func.atanh" parent="std.math" -->
# atanh

[← std.math](../index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## atanh(Float16)

### 签名

```cangjie role=signature
public func atanh(x: Float16): Float16
```

计算半精度浮点数的反双曲正切函数值。

### 契约

参数：

- x: Float16 - 传入的半精度浮点数。-1.0 < `x` < 1.0。

返回值：

- Float16 - 返回传入参数的反双曲正切函数值。

异常：

- IllegalArgumentException - 当参数 `x` 大于等于 1.0 或小于等于 -1.0 时，抛出异常。

## atanh(Float32)

### 签名

```cangjie role=signature
public func atanh(x: Float32): Float32
```

计算单精度浮点数的反双曲正切函数值。

### 契约

参数：

- x: Float32 - 传入的单精度浮点数。-1.0 < `x` < 1.0。

返回值：

- Float32 - 返回传入参数的反双曲正切函数值。

异常：

- IllegalArgumentException - 当参数 `x` 大于等于 1.0 或小于等于 -1.0 时，抛出异常。

## atanh(Float64)

### 签名

```cangjie role=signature
public func atanh(x: Float64): Float64
```

计算双精度浮点数的反双曲正切函数值。

### 契约

参数：

- x: Float64 - 传入的双精度浮点数。-1.0 < `x` < 1.0。

返回值：

- Float64 - 返回传入参数的反双曲正切函数值。

异常：

- IllegalArgumentException - 当参数 `x` 大于等于 1.0 或小于等于 -1.0 时，抛出异常。
