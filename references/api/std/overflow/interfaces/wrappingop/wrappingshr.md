<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.wrappingop.wrappingshr" parent="std.overflow.interface.wrappingop" -->
# WrappingOp<T>.wrappingShr

[← WrappingOp<T>](index.md)

本页汇总 11 个同名重载；先按签名选择，再读取对应契约。

## func wrappingShr(UInt64)

### 签名

```cangjie role=signature
func wrappingShr(y: UInt64): T
```

使用高位截断策略的右移运算。

### 契约

当移位位数大于等于操作数位数时，高位截断。例如，对 Int8 类型的数进行移位，当 y （移位位数）超大于等于 8 时，仅取 y 的低 3 位作为移位位数，以此保证移位位数在 0 到 7 之间。

参数：

- y: UInt64 - 移位位数。

返回值：

- T - 右移运算结果。

## func wrappingShr(UInt64)

适用扩展：[extend Int16 <: WrappingOp<Int16>](extensions/extend-int16-wrappingop-int16.md)。

### 签名

```cangjie role=signature
public func wrappingShr(y: UInt64): Int16
```

使用高位截断策略的右移运算。

### 契约

当右操作数大于等于左操作数位数时，取右操作数的低 4 位作为移位位数。

参数：

- y: UInt64 - 移位位数。

返回值：

- Int16 - 右移运算结果。

## func wrappingShr(UInt64)

适用扩展：[extend Int32 <: WrappingOp<Int32>](extensions/extend-int32-wrappingop-int32.md)。

### 签名

```cangjie role=signature
public func wrappingShr(y: UInt64): Int32
```

使用高位截断策略的右移运算。

### 契约

当右操作数大于等于左操作数位数时，取右操作数的低 5 位作为移位位数。

参数：

- y: UInt64 - 移位位数。

返回值：

- Int32 - 右移运算结果。

## func wrappingShr(UInt64)

适用扩展：[extend Int64 <: WrappingOp<Int64> & WrappingPow](extensions/extend-int64-wrappingop-int64-wrappingpow.md)。

### 签名

```cangjie role=signature
public func wrappingShr(y: UInt64): Int64
```

使用高位截断策略的右移运算。

### 契约

当右操作数大于等于左操作数位数时，取右操作数的低 6 位作为移位位数。

参数：

- y: UInt64 - 移位位数。

返回值：

- Int64 - 右移运算结果。

## func wrappingShr(UInt64)

适用扩展：[extend Int8 <: WrappingOp<Int8>](extensions/extend-int8-wrappingop-int8.md)。

### 签名

```cangjie role=signature
public func wrappingShr(y: UInt64): Int8
```

使用高位截断策略的右移运算。

### 契约

当右操作数大于等于左操作数位数时，取右操作数的低 3 位作为移位位数。

参数：

- y: UInt64 - 移位位数。

返回值：

- Int8 - 右移运算结果。

## func wrappingShr(UInt64)

适用扩展：[extend IntNative <: WrappingOp<IntNative>](extensions/extend-intnative-wrappingop-intnative.md)。

### 签名

```cangjie role=signature
public func wrappingShr(y: UInt64): IntNative
```

使用高位截断策略的右移运算。

### 契约

当右操作数大于等于左操作数位数时，取右操作数的低位作为移位位数，具体取的位数取决于当前系统下 IntNative 的位数。

参数：

- y: UInt64 - 移位位数。

返回值：

- IntNative - 右移运算结果。

## func wrappingShr(UInt64)

适用扩展：[extend UInt16 <: WrappingOp<UInt16>](extensions/extend-uint16-wrappingop-uint16.md)。

### 签名

```cangjie role=signature
public func wrappingShr(y: UInt64): UInt16
```

使用高位截断策略的右移运算。

### 契约

当右操作数大于等于左操作数位数时，取右操作数的低 4 位作为移位位数。

参数：

- y: UInt64 - 移位位数。

返回值：

- UInt16 - 右移运算结果。

## func wrappingShr(UInt64)

适用扩展：[extend UInt32 <: WrappingOp<UInt32>](extensions/extend-uint32-wrappingop-uint32.md)。

### 签名

```cangjie role=signature
public func wrappingShr(y: UInt64): UInt32
```

使用高位截断策略的右移运算。

### 契约

当右操作数大于等于左操作数位数时，取右操作数的低 5 位作为移位位数。

参数：

- y: UInt64 - 移位位数。

返回值：

- UInt32 - 右移运算结果。

## func wrappingShr(UInt64)

适用扩展：[extend UInt64 <: WrappingOp<UInt64>](extensions/extend-uint64-wrappingop-uint64.md)。

### 签名

```cangjie role=signature
public func wrappingShr(y: UInt64): UInt64
```

使用高位截断策略的右移运算。

### 契约

当右操作数大于等于左操作数位数时，取右操作数的低 6 位作为移位位数。

参数：

- y: UInt64 - 移位位数。

返回值：

- UInt64 - 右移运算结果。

## func wrappingShr(UInt64)

适用扩展：[extend UInt8 <: WrappingOp<UInt8>](extensions/extend-uint8-wrappingop-uint8.md)。

### 签名

```cangjie role=signature
public func wrappingShr(y: UInt64): UInt8
```

使用高位截断策略的右移运算。

### 契约

当右操作数大于等于左操作数位数时，取右操作数的低 3 位作为移位位数。

参数：

- y: UInt64 - 移位位数。

返回值：

- UInt8 - 右移运算结果。

## func wrappingShr(UInt64)

适用扩展：[extend UIntNative <: WrappingOp<UIntNative>](extensions/extend-uintnative-wrappingop-uintnative.md)。

### 签名

```cangjie role=signature
public func wrappingShr(y: UInt64): UIntNative
```

使用高位截断策略的右移运算。

### 契约

当右操作数大于等于左操作数位数时，取右操作数的低位作为移位位数，具体取的位数取决于当前系统下 UIntNative 的位数。

参数：

- y: UInt64 - 移位位数。

返回值：

- UIntNative - 右移运算结果。
