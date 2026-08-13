<!-- cj-doc kind="api-member" level="5" id="std.math.func.pow" parent="std.math" -->
# pow

[← std.math](../index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## pow(Float32, Float32)

### 签名

```cangjie role=signature
public func pow(base: Float32, exponent: Float32): Float32
```

求浮点数 `base` 的 `exponent` 次幂。

### 契约

参数：

- base: Float32 - 底数。
- exponent: Float32 - 指数。

返回值：

- Float32 - 返回传入浮点数 `base` 的 `exponent` 次幂。如果值不存在，则返回 `nan`。

## pow(Float32, Int32)

### 签名

```cangjie role=signature
public func pow(base: Float32, exponent: Int32): Float32
```

求浮点数 `base` 的 `exponent` 次幂。

### 契约

参数：

- base: Float32 - 底数。
- exponent: Int32 - 指数。

返回值：

- Float32 - 返回传入浮点数 `base` 的 `exponent` 次幂。

## pow(Float64, Float64)

### 签名

```cangjie role=signature
public func pow(base: Float64, exponent: Float64): Float64
```

求浮点数 `base` 的 `exponent` 次幂。

### 契约

参数：

- base: Float64 - 底数。
- exponent: Float64 - 指数。

返回值：

- Float64 - 返回传入浮点数 `base` 的 `exponent` 次幂。如果值不存在，则返回 `nan`。

## pow(Float64, Int64)

### 签名

```cangjie role=signature
public func pow(base: Float64, exponent: Int64): Float64
```

求浮点数 `base` 的 `exponent` 次幂。

### 契约

参数：

- base: Float64 - 底数。
- exponent: Int64 - 指数。

返回值：

- Float64 - 返回传入浮点数 `base` 的 `exponent` 次幂。
