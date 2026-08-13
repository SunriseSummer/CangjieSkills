<!-- cj-doc kind="api-member" level="5" id="std.math.func.log" parent="std.math" -->
# log

[← std.math](../index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## log(Float16)

### 签名

```cangjie role=signature
public func log(x: Float16): Float16
```

求以 e 为底 `x` 的对数。

### 契约

参数：

- x: Float16 - 真数。

返回值：

- Float16 - 返回以 e 为底 `x` 的对数。

> **说明：**
>
> 返回值存在如下特殊场景：
>
> - 如果传入 `x` 小于 0 或为 NaN，返回 NaN。
> - 如果传入 `x` 等于 0，返回 -Inf。
> - 如果传入 `x` 为 Inf，返回 Inf。

## log(Float32)

### 签名

```cangjie role=signature
public func log(x: Float32): Float32
```

求以 e 为底 `x` 的对数。

### 契约

参数：

- x: Float32 - 真数。

返回值：

- Float32 - 返回以 e 为底 `x` 的对数。

> **说明：**
>
> 返回值存在如下特殊场景：
>
> - 如果传入 `x` 小于 0 或为 NaN，返回 NaN。
> - 如果传入 `x` 等于 0，返回 -Inf。
> - 如果传入 `x` 为 Inf，返回 Inf。

## log(Float64)

### 签名

```cangjie role=signature
public func log(x: Float64): Float64
```

求以 e 为底 `x` 的对数。

### 契约

参数：

- x: Float64 - 真数。

返回值：

- Float64 - 返回以 e 为底 `x` 的对数。

> **说明：**
>
> 返回值存在如下特殊场景：
>
> - 如果传入 `x` 小于 0 或为 NaN，返回 NaN。
> - 如果传入 `x` 等于 0，返回 -Inf。
> - 如果传入 `x` 为 Inf，返回 Inf。
