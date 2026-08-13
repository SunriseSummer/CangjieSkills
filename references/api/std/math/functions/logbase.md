<!-- cj-doc kind="api-member" level="5" id="std.math.func.logbase" parent="std.math" -->
# logBase

[← std.math](../index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## logBase(Float16, Float16)

### 签名

```cangjie role=signature
public func logBase(x: Float16, base: Float16): Float16
```

求以 `base` 为底 `x` 的对数。

### 契约

参数：

- x: Float16 - 真数。真数需要大于 0。
- base: Float16 - 底数。底数需要大于 0，且不能为 1。

返回值：

- Float16 - 返回以 `base` 为底 `x` 的对数。

异常：

- IllegalArgumentException - 当真数或底数不为正，或底数为 1 时，抛出异常。

## logBase(Float32, Float32)

### 签名

```cangjie role=signature
public func logBase(x: Float32, base: Float32): Float32
```

求以 `base` 为底 `x` 的对数。

### 契约

参数：

- x: Float32 - 真数。真数需要大于 0。
- base: Float32 - 底数。底数需要大于 0，且不能为 1。

返回值：

- Float32 - 返回以 `base` 为底 `x` 的对数。

异常：

- IllegalArgumentException - 当真数或底数不为正，或底数为 1 时，抛出异常。

## logBase(Float64, Float64)

### 签名

```cangjie role=signature
public func logBase(x: Float64, base: Float64): Float64
```

求以 `base` 为底 `x` 的对数。

### 契约

参数：

- x: Float64 - 真数。真数需要大于 0。
- base: Float64 - 底数。底数需要大于 0，且不能为 1。

返回值：

- Float64 - 返回以 `base` 为底 `x` 的对数。

异常：

- IllegalArgumentException - 当真数或底数不为正，或底数为 1 时，抛出异常。
