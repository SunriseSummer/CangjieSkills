<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.saturatingop.saturatingsub" parent="std.overflow.interface.saturatingop" -->
# SaturatingOp<T>.saturatingSub

[← SaturatingOp<T>](index.md)

本页汇总 11 个同名重载；先按签名选择，再读取对应契约。

## func saturatingSub(T)

### 签名

```cangjie role=signature
func saturatingSub(y: T): T
```

使用饱和策略的减法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: T - 减数。

返回值：

- T - 减法运算结果。

## func saturatingSub(Int16)

适用扩展：[extend Int16 <: SaturatingOp<Int16>](extensions/extend-int16-saturatingop-int16.md)。

### 签名

```cangjie role=signature
public func saturatingSub(y: Int16): Int16
```

使用饱和策略的减法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: Int16 - 减数。

返回值：

- Int16 - 减法运算结果。

## func saturatingSub(Int32)

适用扩展：[extend Int32 <: SaturatingOp<Int32>](extensions/extend-int32-saturatingop-int32.md)。

### 签名

```cangjie role=signature
public func saturatingSub(y: Int32): Int32
```

使用饱和策略的减法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: Int32 - 减数。

返回值：

- Int32 - 减法运算结果。

## func saturatingSub(Int64)

适用扩展：[extend Int64 <: SaturatingOp<Int64> & SaturatingPow](extensions/extend-int64-saturatingop-int64-saturatingpow.md)。

### 签名

```cangjie role=signature
public func saturatingSub(y: Int64): Int64
```

使用饱和策略的减法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: Int64 - 减数。

返回值：

- Int64 - 减法运算结果。

## func saturatingSub(Int8)

适用扩展：[extend Int8 <: SaturatingOp<Int8>](extensions/extend-int8-saturatingop-int8.md)。

### 签名

```cangjie role=signature
public func saturatingSub(y: Int8): Int8
```

使用饱和策略的减法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: Int8 - 减数。

返回值：

- Int8 - 减法运算结果。

## func saturatingSub(IntNative)

适用扩展：[extend IntNative <: SaturatingOp<IntNative>](extensions/extend-intnative-saturatingop-intnative.md)。

### 签名

```cangjie role=signature
public func saturatingSub(y: IntNative): IntNative
```

使用饱和策略的减法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: IntNative - 减数。

返回值：

- IntNative - 减法运算结果。

## func saturatingSub(UInt16)

适用扩展：[extend UInt16 <: SaturatingOp<UInt16>](extensions/extend-uint16-saturatingop-uint16.md)。

### 签名

```cangjie role=signature
public func saturatingSub(y: UInt16): UInt16
```

使用饱和策略的减法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: UInt16 - 减数。

返回值：

- UInt16 - 减法运算结果。

## func saturatingSub(UInt32)

适用扩展：[extend UInt32 <: SaturatingOp<UInt32>](extensions/extend-uint32-saturatingop-uint32.md)。

### 签名

```cangjie role=signature
public func saturatingSub(y: UInt32): UInt32
```

使用饱和策略的减法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: UInt32 - 减数。

返回值：

- UInt32 - 减法运算结果。

## func saturatingSub(UInt64)

适用扩展：[extend UInt64 <: SaturatingOp<UInt64>](extensions/extend-uint64-saturatingop-uint64.md)。

### 签名

```cangjie role=signature
public func saturatingSub(y: UInt64): UInt64
```

使用饱和策略的减法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: UInt64 - 减数。

返回值：

- UInt64 - 减法运算结果。

## func saturatingSub(UInt8)

适用扩展：[extend UInt8 <: SaturatingOp<UInt8>](extensions/extend-uint8-saturatingop-uint8.md)。

### 签名

```cangjie role=signature
public func saturatingSub(y: UInt8): UInt8
```

使用饱和策略的减法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: UInt8 - 减数。

返回值：

- UInt8 - 减法运算结果。

## func saturatingSub(UIntNative)

适用扩展：[extend UIntNative <: SaturatingOp<UIntNative>](extensions/extend-uintnative-saturatingop-uintnative.md)。

### 签名

```cangjie role=signature
public func saturatingSub(y: UIntNative): UIntNative
```

使用饱和策略的减法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: UIntNative - 减数。

返回值：

- UIntNative - 减法运算结果。
