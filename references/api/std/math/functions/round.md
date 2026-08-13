<!-- cj-doc kind="api-member" level="5" id="std.math.func.round" parent="std.math" -->
# round

[← std.math](../index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## round(Float16)

### 签名

```cangjie role=signature
public func round(x: Float16): Float16
```

此函数采用 IEEE-754 的向最近舍入规则，计算浮点数的舍入值。

### 契约

功能：此函数采用 IEEE-754 的向最近舍入规则，计算浮点数的舍入值。如果该浮点数有两个最近整数，则向偶数舍入。

参数：

- x: Float16 - 需要计算舍入值的浮点数。

返回值：

- Float16 - 返回浮点数向最近整数方向的舍入值。如果该浮点数有两个最近整数，则返回向偶数舍入值。

## round(Float32)

### 签名

```cangjie role=signature
public func round(x: Float32): Float32
```

此函数采用 IEEE-754 的向最近舍入规则，计算浮点数的舍入值。

### 契约

功能：此函数采用 IEEE-754 的向最近舍入规则，计算浮点数的舍入值。如果该浮点数有两个最近整数，则向偶数舍入。

参数：

- x: Float32 - 需要计算舍入值的浮点数。

返回值：

- Float32 - 返回浮点数向最近整数方向的舍入值。如果该浮点数有两个最近整数，则返回向偶数舍入值。

## round(Float64)

### 签名

```cangjie role=signature
public func round(x: Float64): Float64
```

此函数采用 IEEE-754 的向最近舍入规则，计算浮点数的舍入值。

### 契约

功能：此函数采用 IEEE-754 的向最近舍入规则，计算浮点数的舍入值。如果该浮点数有两个最近整数，则向偶数舍入。

参数：

- x: Float64 - 需要计算舍入值的浮点数。

返回值：

- Float64 - 返回浮点数向最近整数方向的舍入值。如果该浮点数有两个最近整数，则返回向偶数舍入值。
