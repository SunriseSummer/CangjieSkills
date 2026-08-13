<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.wrappingop.wrappingsub" parent="std.overflow.interface.wrappingop" -->
# WrappingOp<T>.wrappingSub

[← WrappingOp<T>](index.md)

本页汇总 11 个同名重载；先按签名选择，再读取对应契约。

## func wrappingSub(T)

### 签名

```cangjie role=signature
func wrappingSub(y: T): T
```

使用高位截断策略的减法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: T - 减数。

返回值：

- T - 减法运算结果。

## func wrappingSub(Int16)

适用扩展：[extend Int16 <: WrappingOp<Int16>](extensions/extend-int16-wrappingop-int16.md)。

### 签名

```cangjie role=signature
public func wrappingSub(y: Int16): Int16
```

使用高位截断策略的减法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: Int16 - 减数。

返回值：

- Int16 - 减法运算结果。

## func wrappingSub(Int32)

适用扩展：[extend Int32 <: WrappingOp<Int32>](extensions/extend-int32-wrappingop-int32.md)。

### 签名

```cangjie role=signature
public func wrappingSub(y: Int32): Int32
```

使用高位截断策略的减法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: Int32 - 减数。

返回值：

- Int32 - 减法运算结果。

## func wrappingSub(Int64)

适用扩展：[extend Int64 <: WrappingOp<Int64> & WrappingPow](extensions/extend-int64-wrappingop-int64-wrappingpow.md)。

### 签名

```cangjie role=signature
public func wrappingSub(y: Int64): Int64
```

使用高位截断策略的减法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: Int64 - 减数。

返回值：

- Int64 - 减法运算结果。

## func wrappingSub(Int8)

适用扩展：[extend Int8 <: WrappingOp<Int8>](extensions/extend-int8-wrappingop-int8.md)。

### 签名

```cangjie role=signature
public func wrappingSub(y: Int8): Int8
```

使用高位截断策略的减法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: Int8 - 减数。

返回值：

- Int8 - 减法运算结果。

## func wrappingSub(IntNative)

适用扩展：[extend IntNative <: WrappingOp<IntNative>](extensions/extend-intnative-wrappingop-intnative.md)。

### 签名

```cangjie role=signature
public func wrappingSub(y: IntNative): IntNative
```

使用高位截断策略的减法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: IntNative - 减数。

返回值：

- IntNative - 减法运算结果。

## func wrappingSub(UInt16)

适用扩展：[extend UInt16 <: WrappingOp<UInt16>](extensions/extend-uint16-wrappingop-uint16.md)。

### 签名

```cangjie role=signature
public func wrappingSub(y: UInt16): UInt16
```

使用高位截断策略的减法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: UInt16 - 减数。

返回值：

- UInt16 - 减法运算结果。

## func wrappingSub(UInt32)

适用扩展：[extend UInt32 <: WrappingOp<UInt32>](extensions/extend-uint32-wrappingop-uint32.md)。

### 签名

```cangjie role=signature
public func wrappingSub(y: UInt32): UInt32
```

使用高位截断策略的减法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: UInt32 - 减数。

返回值：

- UInt32 - 减法运算结果。

## func wrappingSub(UInt64)

适用扩展：[extend UInt64 <: WrappingOp<UInt64>](extensions/extend-uint64-wrappingop-uint64.md)。

### 签名

```cangjie role=signature
public func wrappingSub(y: UInt64): UInt64
```

使用高位截断策略的减法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: UInt64 - 减数。

返回值：

- UInt64 - 减法运算结果。

## func wrappingSub(UInt8)

适用扩展：[extend UInt8 <: WrappingOp<UInt8>](extensions/extend-uint8-wrappingop-uint8.md)。

### 签名

```cangjie role=signature
public func wrappingSub(y: UInt8): UInt8
```

使用高位截断策略的减法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: UInt8 - 减数。

返回值：

- UInt8 - 减法运算结果。

## func wrappingSub(UIntNative)

适用扩展：[extend UIntNative <: WrappingOp<UIntNative>](extensions/extend-uintnative-wrappingop-uintnative.md)。

### 签名

```cangjie role=signature
public func wrappingSub(y: UIntNative): UIntNative
```

使用高位截断策略的减法运算。

### 契约

当运算出现溢出时，高位截断，否则返回运算结果。

参数：

- y: UIntNative - 减数。

返回值：

- UIntNative - 减法运算结果。
