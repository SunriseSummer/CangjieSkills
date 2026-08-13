<!-- cj-doc kind="api-member" level="5" id="std.math.func.fmod" parent="std.math" -->
# fmod

[← std.math](../index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## fmod(Float16, Float16)

### 签名

```cangjie role=signature
public func fmod(x: Float16, y: Float16): Float16
```

求两个半精度浮点数 x/y 的余数。

### 契约

参数：

- x: Float16 - 传入的被除数。
- y: Float16 - 传入的除数。

返回值：

- Float16 - 返回 x/y 的余数, 当 x 或 y 为 `NaN` 时 返回 `NaN`。

异常：

- IllegalArgumentException - 当 x 为 `Inf` 或 y 为 0 时，抛出异常。

## fmod(Float32, Float32)

### 签名

```cangjie role=signature
public func fmod(x: Float32, y: Float32): Float32
```

求两个单精度浮点数 x/y 的余数。

### 契约

参数：

- x: Float32 - 传入的被除数。
- y: Float32 - 传入的除数。

返回值：

- Float32 - 返回 x/y 的余数, 当 x 或 y 为 `NaN` 时 返回 `NaN`。

异常：

- IllegalArgumentException - 当 x 为 `Inf` 或 y 为 0 时，抛出异常。

## fmod(Float64, Float64)

### 签名

```cangjie role=signature
public func fmod(x: Float64, y: Float64): Float64
```

求两个双精度浮点数 x/y 的余数。

### 契约

参数：

- x: Float64 - 传入的被除数。
- y: Float64 - 传入的除数。

返回值：

- Float64 - 返回 x/y 的余数, 当 x 或 y 为 `NaN` 时 返回 `NaN`。

异常：

- IllegalArgumentException - 当 x 为 `Inf` 或 y 为 0 时，抛出异常。
