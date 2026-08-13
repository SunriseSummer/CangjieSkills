<!-- cj-doc kind="api-member" level="5" id="std.math.func.clamp" parent="std.math" -->
# clamp

[← std.math](../index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## clamp(Float16, Float16, Float16)

### 签名

```cangjie role=signature
public func clamp(v: Float16, min: Float16, max: Float16): Float16
```

求浮点数的范围区间数。

### 契约

功能：求浮点数的范围区间数。如果此浮点数在该范围区间则返回此浮点数；如果此浮点数小于这个范围区间，则返回该范围区间的最小值；如果此浮点数大于这个范围区间，则返回该范围区间的最大值；如果是 `NaN` 则返回 `NaN`。

参数：

- v: Float16 - 传入一个浮点数。
- min: Float16 - 指定的最小值。
- max: Float16 - 指定的最大值。

返回值：

- Float16 - 如果 `v` 在 `min` 与 `max` 之间则返回 `v`；如果 `v` 小于等于 `min` 则返回 `min`；如果 `v` 大于等于 `max`，则返回 `max`；如果是 `NaN` 则返回 `NaN`。

异常：

- IllegalArgumentException - 当参数 `min` 大于参数 `max` 或者 `min` 和 `max` 是 `NaN` 时，抛出异常。

## clamp(Float32, Float32, Float32)

### 签名

```cangjie role=signature
public func clamp(v: Float32, min: Float32, max: Float32): Float32
```

求浮点数的范围区间数。

### 契约

功能：求浮点数的范围区间数。如果此浮点数在该范围区间则返回此浮点数；如果此浮点数小于这个范围区间，则返回该范围区间的最小值；如果此浮点数大于这个范围区间，则返回该范围区间的最大值；如果是 `NaN` 则返回 `NaN`。

参数：

- v: Float32 - 传入一个浮点数。
- min: Float32 - 指定的最小值。
- max: Float32 - 指定的最大值。

返回值：

- Float32 - 如果 `v` 在 `min` 与 `max` 之间则返回 `v`；如果 `v` 小于等于 `min` 则返回 `min`；如果 `v` 大于等于 `max`，则返回 `max`；如果是 `NaN` 则返回 `NaN`。

异常：

- IllegalArgumentException - 当参数 `min` 大于参数 `max` 或者 `min` 和 `max` 是 `NaN` 时，抛出异常。

## clamp(Float64, Float64, Float64)

### 签名

```cangjie role=signature
public func clamp(v: Float64, min: Float64, max: Float64): Float64
```

求浮点数的范围区间数。

### 契约

功能：求浮点数的范围区间数。如果此浮点数在该范围区间则返回此浮点数；如果此浮点数小于这个范围区间，则返回该范围区间的最小值；如果此浮点数大于这个范围区间，则返回该范围区间的最大值；如果是 `NaN` 则返回 `NaN`。

参数：

- v: Float64 - 传入一个浮点数。
- min: Float64 - 指定的最小值。
- max: Float64 - 指定的最大值。

返回值：

- Float64 - 如果 `v` 在 `min` 与 `max` 之间则返回 `v`；如果 `v` 小于等于 `min` 则返回 `min`；如果 `v` 大于等于 `max`，则返回 `max`；如果是 `NaN` 则返回 `NaN`。

异常：

- IllegalArgumentException - 当参数 `min` 大于参数 `max` 或者 `min` 和 `max` 是 `NaN` 时，抛出异常。
