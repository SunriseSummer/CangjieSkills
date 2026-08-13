<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.saturatingop.saturatingshr" parent="std.overflow.interface.saturatingop" -->
# SaturatingOp<T>.saturatingShr

[← SaturatingOp<T>](index.md)

本页汇总 11 个同名重载；先按签名选择，再读取对应契约。

## func saturatingShr(UInt64)

### 签名

```cangjie role=signature
func saturatingShr(y: UInt64): T
```

使用饱和策略的右移运算。

### 契约

当移位位数大于等于操作数位数时，将移位位数置为操作数位数 - 1，返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- T - 右移运算结果。

## func saturatingShr(UInt64)

适用扩展：[extend Int16 <: SaturatingOp<Int16>](extensions/extend-int16-saturatingop-int16.md)。

### 签名

```cangjie role=signature
public func saturatingShr(y: UInt64): Int16
```

使用饱和策略的右移运算。

### 契约

当移位位数大于等于操作数位数时，将移位位数置为操作数位数 - 1，返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- Int16 - 右移运算结果。

## func saturatingShr(UInt64)

适用扩展：[extend Int32 <: SaturatingOp<Int32>](extensions/extend-int32-saturatingop-int32.md)。

### 签名

```cangjie role=signature
public func saturatingShr(y: UInt64): Int32
```

使用饱和策略的右移运算。

### 契约

当移位位数大于等于操作数位数时，将移位位数置为操作数位数 - 1，返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- Int32 - 右移运算结果。

## func saturatingShr(UInt64)

适用扩展：[extend Int64 <: SaturatingOp<Int64> & SaturatingPow](extensions/extend-int64-saturatingop-int64-saturatingpow.md)。

### 签名

```cangjie role=signature
public func saturatingShr(y: UInt64): Int64
```

使用饱和策略的右移运算。

### 契约

当移位位数大于等于操作数位数时，将移位位数置为操作数位数 - 1，返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- Int64 - 右移运算结果。

## func saturatingShr(UInt64)

适用扩展：[extend Int8 <: SaturatingOp<Int8>](extensions/extend-int8-saturatingop-int8.md)。

### 签名

```cangjie role=signature
public func saturatingShr(y: UInt64): Int8
```

使用饱和策略的右移运算。

### 契约

当移位位数大于等于操作数位数时，将移位位数置为操作数位数 - 1，返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- Int8 - 右移运算结果。

## func saturatingShr(UInt64)

适用扩展：[extend IntNative <: SaturatingOp<IntNative>](extensions/extend-intnative-saturatingop-intnative.md)。

### 签名

```cangjie role=signature
public func saturatingShr(y: UInt64): IntNative
```

使用饱和策略的右移运算。

### 契约

当移位位数大于等于操作数位数时，将移位位数置为操作数位数 - 1，返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- IntNative - 右移运算结果。

## func saturatingShr(UInt64)

适用扩展：[extend UInt16 <: SaturatingOp<UInt16>](extensions/extend-uint16-saturatingop-uint16.md)。

### 签名

```cangjie role=signature
public func saturatingShr(y: UInt64): UInt16
```

使用饱和策略的右移运算。

### 契约

当移位位数大于等于操作数位数时，将移位位数置为操作数位数 - 1，返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- UInt16 - 右移运算结果。

## func saturatingShr(UInt64)

适用扩展：[extend UInt32 <: SaturatingOp<UInt32>](extensions/extend-uint32-saturatingop-uint32.md)。

### 签名

```cangjie role=signature
public func saturatingShr(y: UInt64): UInt32
```

使用饱和策略的右移运算。

### 契约

当移位位数大于等于操作数位数时，将移位位数置为操作数位数 - 1，返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- UInt32 - 右移运算结果。

## func saturatingShr(UInt64)

适用扩展：[extend UInt64 <: SaturatingOp<UInt64>](extensions/extend-uint64-saturatingop-uint64.md)。

### 签名

```cangjie role=signature
public func saturatingShr(y: UInt64): UInt64
```

使用饱和策略的右移运算。

### 契约

当移位位数大于等于操作数位数时，将移位位数置为操作数位数 - 1，返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- UInt64 - 右移运算结果。

## func saturatingShr(UInt64)

适用扩展：[extend UInt8 <: SaturatingOp<UInt8>](extensions/extend-uint8-saturatingop-uint8.md)。

### 签名

```cangjie role=signature
public func saturatingShr(y: UInt64): UInt8
```

使用饱和策略的右移运算。

### 契约

当移位位数大于等于操作数位数时，将移位位数置为操作数位数 - 1，返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- UInt8 - 右移运算结果。

## func saturatingShr(UInt64)

适用扩展：[extend UIntNative <: SaturatingOp<UIntNative>](extensions/extend-uintnative-saturatingop-uintnative.md)。

### 签名

```cangjie role=signature
public func saturatingShr(y: UInt64): UIntNative
```

使用饱和策略的右移运算。

### 契约

当移位位数大于等于操作数位数时，将移位位数置为操作数位数 - 1，返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- UIntNative - 右移运算结果。
