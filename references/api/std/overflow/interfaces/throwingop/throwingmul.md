<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.throwingop.throwingmul" parent="std.overflow.interface.throwingop" -->
# ThrowingOp<T>.throwingMul

[← ThrowingOp<T>](index.md)

本页汇总 11 个同名重载；先按签名选择，再读取对应契约。

## func throwingMul(T)

### 签名

```cangjie role=signature
func throwingMul(y: T): T
```

使用抛出异常策略的乘法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: T - 乘数。

返回值：

- T - 乘法运算结果。

异常：

- OverflowException - 当乘法运算出现溢出时，抛出异常。

## func throwingMul(Int16)

适用扩展：[extend Int16 <: ThrowingOp<Int16>](extensions/extend-int16-throwingop-int16.md)。

### 签名

```cangjie role=signature
public func throwingMul(y: Int16): Int16
```

使用抛出异常策略的乘法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: Int16 - 乘数。

返回值：

- Int16 - 乘法运算结果。

异常：

- OverflowException - 当乘法运算出现溢出时，抛出异常。

## func throwingMul(Int32)

适用扩展：[extend Int32 <: ThrowingOp<Int32>](extensions/extend-int32-throwingop-int32.md)。

### 签名

```cangjie role=signature
public func throwingMul(y: Int32): Int32
```

使用抛出异常策略的乘法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: Int32 - 乘数。

返回值：

- Int32 - 乘法运算结果。

异常：

- OverflowException - 当乘法运算出现溢出时，抛出异常。

## func throwingMul(Int64)

适用扩展：[extend Int64 <: ThrowingOp<Int64> & ThrowingPow](extensions/extend-int64-throwingop-int64-throwingpow.md)。

### 签名

```cangjie role=signature
public func throwingMul(y: Int64): Int64
```

使用抛出异常策略的乘法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: Int64 - 乘数。

返回值：

- Int64 - 乘法运算结果。

异常：

- OverflowException - 当乘法运算出现溢出时，抛出异常。

## func throwingMul(Int8)

适用扩展：[extend Int8 <: ThrowingOp<Int8>](extensions/extend-int8-throwingop-int8.md)。

### 签名

```cangjie role=signature
public func throwingMul(y: Int8): Int8
```

使用抛出异常策略的乘法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: Int8 - 乘数。

返回值：

- Int8 - 乘法运算结果。

异常：

- OverflowException - 当乘法运算出现溢出时，抛出异常。

## func throwingMul(IntNative)

适用扩展：[extend IntNative <: ThrowingOp<IntNative>](extensions/extend-intnative-throwingop-intnative.md)。

### 签名

```cangjie role=signature
public func throwingMul(y: IntNative): IntNative
```

使用抛出异常策略的乘法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: IntNative - 乘数。

返回值：

- IntNative - 乘法运算结果。

异常：

- OverflowException - 当乘法运算出现溢出时，抛出异常。

## func throwingMul(UInt16)

适用扩展：[extend UInt16 <: ThrowingOp<UInt16>](extensions/extend-uint16-throwingop-uint16.md)。

### 签名

```cangjie role=signature
public func throwingMul(y: UInt16): UInt16
```

使用抛出异常策略的乘法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: UInt16 - 乘数。

返回值：

- UInt16 - 乘法运算结果。

异常：

- OverflowException - 当乘法运算出现溢出时，抛出异常。

## func throwingMul(UInt32)

适用扩展：[extend UInt32 <: ThrowingOp<UInt32>](extensions/extend-uint32-throwingop-uint32.md)。

### 签名

```cangjie role=signature
public func throwingMul(y: UInt32): UInt32
```

使用抛出异常策略的乘法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: UInt32 - 乘数。

返回值：

- UInt32 - 乘法运算结果。

异常：

- OverflowException - 当乘法运算出现溢出时，抛出异常。

## func throwingMul(UInt64)

适用扩展：[extend UInt64 <: ThrowingOp<UInt64>](extensions/extend-uint64-throwingop-uint64.md)。

### 签名

```cangjie role=signature
public func throwingMul(y: UInt64): UInt64
```

使用抛出异常策略的乘法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: UInt64 - 乘数。

返回值：

- UInt64 - 乘法运算结果。

异常：

- OverflowException - 当乘法运算出现溢出时，抛出异常。

## func throwingMul(UInt8)

适用扩展：[extend UInt8 <: ThrowingOp<UInt8>](extensions/extend-uint8-throwingop-uint8.md)。

### 签名

```cangjie role=signature
public func throwingMul(y: UInt8): UInt8
```

使用抛出异常策略的乘法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: UInt8 - 乘数。

返回值：

- UInt8 - 乘法运算结果。

异常：

- OverflowException - 当乘法运算出现溢出时，抛出异常。

## func throwingMul(UIntNative)

适用扩展：[extend UIntNative <: ThrowingOp<UIntNative>](extensions/extend-uintnative-throwingop-uintnative.md)。

### 签名

```cangjie role=signature
public func throwingMul(y: UIntNative): UIntNative
```

使用抛出异常策略的乘法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: UIntNative - 乘数。

返回值：

- UIntNative - 乘法运算结果。

异常：

- OverflowException - 当乘法运算出现溢出时，抛出异常。
