<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.wrappingop.wrappingmul" parent="std.overflow.interface.wrappingop" -->
# WrappingOp<T>.wrappingMul

[← WrappingOp<T>](index.md)

本页汇总 11 个同名重载；先按签名选择，再读取对应契约。

## func wrappingMul(T)

### 签名

```cangjie role=signature
func wrappingMul(y: T): T
```

使用高位截断策略的乘法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: T - 乘数。

返回值：

- T - 乘法运算结果。

## func wrappingMul(Int16)

适用扩展：[extend Int16 <: WrappingOp<Int16>](extensions/extend-int16-wrappingop-int16.md)。

### 签名

```cangjie role=signature
public func wrappingMul(y: Int16): Int16
```

使用高位截断策略的乘法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: Int16 - 乘数。

返回值：

- Int16 - 乘法运算结果。

## func wrappingMul(Int32)

适用扩展：[extend Int32 <: WrappingOp<Int32>](extensions/extend-int32-wrappingop-int32.md)。

### 签名

```cangjie role=signature
public func wrappingMul(y: Int32): Int32
```

使用高位截断策略的乘法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: Int32 - 乘数。

返回值：

- Int32 - 乘法运算结果。

## func wrappingMul(Int64)

适用扩展：[extend Int64 <: WrappingOp<Int64> & WrappingPow](extensions/extend-int64-wrappingop-int64-wrappingpow.md)。

### 签名

```cangjie role=signature
public func wrappingMul(y: Int64): Int64
```

使用高位截断策略的乘法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: Int64 - 乘数。

返回值：

- Int64 - 乘法运算结果。

## func wrappingMul(Int8)

适用扩展：[extend Int8 <: WrappingOp<Int8>](extensions/extend-int8-wrappingop-int8.md)。

### 签名

```cangjie role=signature
public func wrappingMul(y: Int8): Int8
```

使用高位截断策略的乘法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: Int8 - 乘数。

返回值：

- Int8 - 乘法运算结果。

## func wrappingMul(IntNative)

适用扩展：[extend IntNative <: WrappingOp<IntNative>](extensions/extend-intnative-wrappingop-intnative.md)。

### 签名

```cangjie role=signature
public func wrappingMul(y: IntNative): IntNative
```

使用高位截断策略的乘法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: IntNative - 乘数。

返回值：

- IntNative - 乘法运算结果。

## func wrappingMul(UInt16)

适用扩展：[extend UInt16 <: WrappingOp<UInt16>](extensions/extend-uint16-wrappingop-uint16.md)。

### 签名

```cangjie role=signature
public func wrappingMul(y: UInt16): UInt16
```

使用高位截断策略的乘法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: UInt16 - 乘数。

返回值：

- UInt16 - 乘法运算结果。

## func wrappingMul(UInt32)

适用扩展：[extend UInt32 <: WrappingOp<UInt32>](extensions/extend-uint32-wrappingop-uint32.md)。

### 签名

```cangjie role=signature
public func wrappingMul(y: UInt32): UInt32
```

使用高位截断策略的乘法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: UInt32 - 乘数。

返回值：

- UInt32 - 乘法运算结果。

## func wrappingMul(UInt64)

适用扩展：[extend UInt64 <: WrappingOp<UInt64>](extensions/extend-uint64-wrappingop-uint64.md)。

### 签名

```cangjie role=signature
public func wrappingMul(y: UInt64): UInt64
```

使用高位截断策略的乘法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: UInt64 - 乘数。

返回值：

- UInt64 - 乘法运算结果。

## func wrappingMul(UInt8)

适用扩展：[extend UInt8 <: WrappingOp<UInt8>](extensions/extend-uint8-wrappingop-uint8.md)。

### 签名

```cangjie role=signature
public func wrappingMul(y: UInt8): UInt8
```

使用高位截断策略的乘法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: UInt8 - 乘数。

返回值：

- UInt8 - 乘法运算结果。

## func wrappingMul(UIntNative)

适用扩展：[extend UIntNative <: WrappingOp<UIntNative>](extensions/extend-uintnative-wrappingop-uintnative.md)。

### 签名

```cangjie role=signature
public func wrappingMul(y: UIntNative): UIntNative
```

使用高位截断策略的乘法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: UIntNative - 乘数。

返回值：

- UIntNative - 乘法运算结果。
