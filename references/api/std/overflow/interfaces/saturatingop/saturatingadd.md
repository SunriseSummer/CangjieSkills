<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.saturatingop.saturatingadd" parent="std.overflow.interface.saturatingop" -->
# SaturatingOp<T>.saturatingAdd

[← SaturatingOp<T>](index.md)

本页汇总 11 个同名重载；先按签名选择，再读取对应契约。

## func saturatingAdd(T)

### 签名

```cangjie role=signature
func saturatingAdd(y: T): T
```

使用饱和策略的加法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: T - 加数。

返回值：

- T - 加法运算结果。

## func saturatingAdd(Int16)

适用扩展：[extend Int16 <: SaturatingOp<Int16>](extensions/extend-int16-saturatingop-int16.md)。

### 签名

```cangjie role=signature
public func saturatingAdd(y: Int16): Int16
```

使用饱和策略的加法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: Int16 - 加数。

返回值：

- Int16 - 加法运算结果。

## func saturatingAdd(Int32)

适用扩展：[extend Int32 <: SaturatingOp<Int32>](extensions/extend-int32-saturatingop-int32.md)。

### 签名

```cangjie role=signature
public func saturatingAdd(y: Int32): Int32
```

使用饱和策略的加法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: Int32 - 加数。

返回值：

- Int32 - 加法运算结果。

## func saturatingAdd(Int64)

适用扩展：[extend Int64 <: SaturatingOp<Int64> & SaturatingPow](extensions/extend-int64-saturatingop-int64-saturatingpow.md)。

### 签名

```cangjie role=signature
public func saturatingAdd(y: Int64): Int64
```

使用饱和策略的加法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: Int64 - 加数。

返回值：

- Int64 - 加法运算结果。

## func saturatingAdd(Int8)

适用扩展：[extend Int8 <: SaturatingOp<Int8>](extensions/extend-int8-saturatingop-int8.md)。

### 签名

```cangjie role=signature
public func saturatingAdd(y: Int8): Int8
```

使用饱和策略的加法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: Int8 - 加数。

返回值：

- Int8 - 加法运算结果。

## func saturatingAdd(IntNative)

适用扩展：[extend IntNative <: SaturatingOp<IntNative>](extensions/extend-intnative-saturatingop-intnative.md)。

### 签名

```cangjie role=signature
public func saturatingAdd(y: IntNative): IntNative
```

使用饱和策略的加法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: IntNative - 加数。

返回值：

- IntNative - 加法运算结果。

## func saturatingAdd(UInt16)

适用扩展：[extend UInt16 <: SaturatingOp<UInt16>](extensions/extend-uint16-saturatingop-uint16.md)。

### 签名

```cangjie role=signature
public func saturatingAdd(y: UInt16): UInt16
```

使用饱和策略的加法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: UInt16 - 加数。

返回值：

- UInt16 - 加法运算结果。

## func saturatingAdd(UInt32)

适用扩展：[extend UInt32 <: SaturatingOp<UInt32>](extensions/extend-uint32-saturatingop-uint32.md)。

### 签名

```cangjie role=signature
public func saturatingAdd(y: UInt32): UInt32
```

使用饱和策略的加法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: UInt32 - 加数。

返回值：

- UInt32 - 加法运算结果。

## func saturatingAdd(UInt64)

适用扩展：[extend UInt64 <: SaturatingOp<UInt64>](extensions/extend-uint64-saturatingop-uint64.md)。

### 签名

```cangjie role=signature
public func saturatingAdd(y: UInt64): UInt64
```

使用饱和策略的加法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: UInt64 - 加数。

返回值：

- UInt64 - 加法运算结果。

## func saturatingAdd(UInt8)

适用扩展：[extend UInt8 <: SaturatingOp<UInt8>](extensions/extend-uint8-saturatingop-uint8.md)。

### 签名

```cangjie role=signature
public func saturatingAdd(y: UInt8): UInt8
```

使用饱和策略的加法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: UInt8 - 加数。

返回值：

- UInt8 - 加法运算结果。

## func saturatingAdd(UIntNative)

适用扩展：[extend UIntNative <: SaturatingOp<UIntNative>](extensions/extend-uintnative-saturatingop-uintnative.md)。

### 签名

```cangjie role=signature
public func saturatingAdd(y: UIntNative): UIntNative
```

使用饱和策略的加法运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

参数：

- y: UIntNative - 加数。

返回值：

- UIntNative - 加法运算结果。
