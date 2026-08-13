<!-- cj-doc kind="api-member" level="5" id="std.math.func.abs" parent="std.math" -->
# abs

[← std.math](../index.md)

本页汇总 7 个同名重载；先按签名选择，再读取对应契约。

## abs(Float16)

### 签名

```cangjie role=signature
public func abs(x: Float16): Float16
```

求一个半精度浮点数的绝对值。

### 契约

参数：

- x: Float16 - 传入的半精度浮点数。

返回值：

- Float16 - 返回传入参数的绝对值。

## abs(Float32)

### 签名

```cangjie role=signature
public func abs(x: Float32): Float32
```

求一个单精度浮点数的绝对值。

### 契约

参数：

- x: Float32 - 传入的单精度浮点数。

返回值：

- Float32 - 返回传入参数的绝对值。

## abs(Float64)

### 签名

```cangjie role=signature
public func abs(x: Float64): Float64
```

求一个双精度浮点数的绝对值。

### 契约

参数：

- x: Float64 - 传入的双精度浮点数。

返回值：

- Float64 - 返回传入参数的绝对值。

## abs(Int16)

### 签名

```cangjie role=signature
public func abs(x: Int16): Int16
```

求一个 16 位有符号整数的绝对值。

### 契约

参数：

- x: Int16 - 传入的 16 位有符号整数。

返回值：

- Int16 - 返回传入参数的绝对值。

异常：

- OverflowException - 当输入参数是有符号整数的最小值，抛出异常。

## abs(Int32)

### 签名

```cangjie role=signature
public func abs(x: Int32): Int32
```

求一个 32 位有符号整数的绝对值。

### 契约

参数：

- x: Int32 - 传入的 32 位有符号整数。

返回值：

- Int32 - 返回传入参数的绝对值。

异常：

- OverflowException - 当输入参数是有符号整数的最小值，抛出异常。

## abs(Int64)

### 签名

```cangjie role=signature
public func abs(x: Int64): Int64
```

求一个 64 位有符号整数的绝对值。

### 契约

参数：

- x: Int64 - 传入的 64 位有符号整数。

返回值：

- Int64 - 返回传入参数的绝对值。

异常：

- OverflowException - 当输入参数是有符号整数的最小值，抛出异常。

## abs(Int8)

### 签名

```cangjie role=signature
public func abs(x: Int8): Int8
```

求一个 8 位有符号整数的绝对值。

### 契约

参数：

- x: Int8 - 传入的 8 位有符号整数。

返回值：

- Int8 - 返回传入参数的绝对值。

异常：

- OverflowException - 当输入参数是有符号整数的最小值，抛出异常。
