<!-- cj-doc kind="api-member" level="5" id="std.math.func.sqrt" parent="std.math" -->
# sqrt

[← std.math](../index.md)

本页汇总 3 个同名重载；先按签名选择，再读取对应契约。

## sqrt(Float16)

### 签名

```cangjie role=signature
public func sqrt(x: Float16): Float16
```

求浮点数的算术平方根。

### 契约

参数：

- x: Float16 - 需要计算算数平方根的浮点数。`x` 需要大于等于 0。

返回值：

- Float16 - 返回传入的浮点数的算术平方根。

异常：

- IllegalArgumentException - 当参数为负数时，抛出异常。

## sqrt(Float32)

### 签名

```cangjie role=signature
public func sqrt(x: Float32): Float32
```

求浮点数的算术平方根。

### 契约

参数：

- x: Float32 - 需要计算算数平方根的浮点数。`x` 需要大于等于 0。

返回值：

- Float32 - 返回传入的浮点数的算术平方根。

异常：

- IllegalArgumentException - 当参数为负数时，抛出异常。

## sqrt(Float64)

### 签名

```cangjie role=signature
public func sqrt(x: Float64): Float64
```

求浮点数的算术平方根。

### 契约

参数：

- x: Float64 - 需要计算算数平方根的浮点数。`x` 需要大于等于 0。

返回值：

- Float64 - 返回传入的浮点数的算术平方根。

异常：

- IllegalArgumentException - 当参数为负数时，抛出异常。
