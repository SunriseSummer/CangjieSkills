<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.throwingop.throwingadd" parent="std.overflow.interface.throwingop" -->
# ThrowingOp<T>.throwingAdd

[← ThrowingOp<T>](index.md)

本页汇总 11 个同名重载；先按签名选择，再读取对应契约。

## func throwingAdd(T)

### 签名

```cangjie role=signature
func throwingAdd(y: T): T
```

使用抛出异常策略的加法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: T - 加数。

返回值：

- T - 加法运算结果。

异常：

- OverflowException - 当加法运算出现溢出时，抛出异常。

## func throwingAdd(Int16)

适用扩展：[extend Int16 <: ThrowingOp<Int16>](extensions/extend-int16-throwingop-int16.md)。

### 签名

```cangjie role=signature
public func throwingAdd(y: Int16): Int16
```

使用抛出异常策略的加法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: Int16 - 加数。

返回值：

- Int16 - 加法运算结果。

异常：

- OverflowException - 当加法运算出现溢出时，抛出异常。

## func throwingAdd(Int32)

适用扩展：[extend Int32 <: ThrowingOp<Int32>](extensions/extend-int32-throwingop-int32.md)。

### 签名

```cangjie role=signature
public func throwingAdd(y: Int32): Int32
```

使用抛出异常策略的加法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: Int32 - 加数。

返回值：

- Int32 - 加法运算结果。

异常：

- OverflowException - 当加法运算出现溢出时，抛出异常。

## func throwingAdd(Int64)

适用扩展：[extend Int64 <: ThrowingOp<Int64> & ThrowingPow](extensions/extend-int64-throwingop-int64-throwingpow.md)。

### 签名

```cangjie role=signature
public func throwingAdd(y: Int64): Int64
```

使用抛出异常策略的加法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: Int64 - 加数。

返回值：

- Int64 - 加法运算结果。

异常：

- OverflowException - 当加法运算出现溢出时，抛出异常。

## func throwingAdd(Int8)

适用扩展：[extend Int8 <: ThrowingOp<Int8>](extensions/extend-int8-throwingop-int8.md)。

### 签名

```cangjie role=signature
public func throwingAdd(y: Int8): Int8
```

使用抛出异常策略的加法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: Int8 - 加数。

返回值：

- Int8 - 加法运算结果。

异常：

- OverflowException - 当加法运算出现溢出时，抛出异常。

## func throwingAdd(IntNative)

适用扩展：[extend IntNative <: ThrowingOp<IntNative>](extensions/extend-intnative-throwingop-intnative.md)。

### 签名

```cangjie role=signature
public func throwingAdd(y: IntNative): IntNative
```

使用抛出异常策略的加法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: IntNative - 加数。

返回值：

- IntNative - 加法运算结果。

异常：

- OverflowException - 当加法运算出现溢出时，抛出异常。

## func throwingAdd(UInt16)

适用扩展：[extend UInt16 <: ThrowingOp<UInt16>](extensions/extend-uint16-throwingop-uint16.md)。

### 签名

```cangjie role=signature
public func throwingAdd(y: UInt16): UInt16
```

使用抛出异常策略的加法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: UInt16 - 加数。

返回值：

- UInt16 - 加法运算结果。

异常：

- OverflowException - 当加法运算出现溢出时，抛出异常。

## func throwingAdd(UInt32)

适用扩展：[extend UInt32 <: ThrowingOp<UInt32>](extensions/extend-uint32-throwingop-uint32.md)。

### 签名

```cangjie role=signature
public func throwingAdd(y: UInt32): UInt32
```

使用抛出异常策略的加法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: UInt32 - 加数。

返回值：

- UInt32 - 加法运算结果。

异常：

- OverflowException - 当加法运算出现溢出时，抛出异常。

## func throwingAdd(UInt64)

适用扩展：[extend UInt64 <: ThrowingOp<UInt64>](extensions/extend-uint64-throwingop-uint64.md)。

### 签名

```cangjie role=signature
public func throwingAdd(y: UInt64): UInt64
```

使用抛出异常策略的加法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: UInt64 - 加数。

返回值：

- UInt64 - 加法运算结果。

异常：

- OverflowException - 当加法运算出现溢出时，抛出异常。

## func throwingAdd(UInt8)

适用扩展：[extend UInt8 <: ThrowingOp<UInt8>](extensions/extend-uint8-throwingop-uint8.md)。

### 签名

```cangjie role=signature
public func throwingAdd(y: UInt8): UInt8
```

使用抛出异常策略的加法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: UInt8 - 加数。

返回值：

- UInt8 - 加法运算结果。

异常：

- OverflowException - 当加法运算出现溢出时，抛出异常。

## func throwingAdd(UIntNative)

适用扩展：[extend UIntNative <: ThrowingOp<UIntNative>](extensions/extend-uintnative-throwingop-uintnative.md)。

### 签名

```cangjie role=signature
public func throwingAdd(y: UIntNative): UIntNative
```

使用抛出异常策略的加法运算。

### 契约

当运算出现溢出时，抛出异常，否则返回运算结果。

参数：

- y: UIntNative - 加数。

返回值：

- UIntNative - 加法运算结果。

异常：

- OverflowException - 当加法运算出现溢出时，抛出异常。
