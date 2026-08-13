<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.throwingop.throwingshl" parent="std.overflow.interface.throwingop" -->
# ThrowingOp<T>.throwingShl

[← ThrowingOp<T>](index.md)

本页汇总 11 个同名重载；先按签名选择，再读取对应契约。

## func throwingShl(UInt64)

### 签名

```cangjie role=signature
func throwingShl(y: UInt64): T
```

使用抛出异常策略的左移运算。

### 契约

当移位位数大于等于操作数位数时，抛出异常，否则返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- T - 左移运算结果。

异常：

- OvershiftException - 当移位位数大于等于操作数位数时，抛出异常。

## func throwingShl(UInt64)

适用扩展：[extend Int16 <: ThrowingOp<Int16>](extensions/extend-int16-throwingop-int16.md)。

### 签名

```cangjie role=signature
public func throwingShl(y: UInt64): Int16
```

使用抛出异常策略的左移运算。

### 契约

当移位位数大于等于操作数位数时，返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- Int16 - 左移运算结果。

异常：

- OvershiftException - 当移位位数大于等于操作数位数时，抛出异常。

## func throwingShl(UInt64)

适用扩展：[extend Int32 <: ThrowingOp<Int32>](extensions/extend-int32-throwingop-int32.md)。

### 签名

```cangjie role=signature
public func throwingShl(y: UInt64): Int32
```

使用抛出异常策略的左移运算。

### 契约

当移位位数大于等于操作数位数时，抛出异常，否则返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- Int32 - 左移运算结果。

异常：

- OvershiftException - 当移位位数大于等于操作数位数时，抛出异常。

## func throwingShl(UInt64)

适用扩展：[extend Int64 <: ThrowingOp<Int64> & ThrowingPow](extensions/extend-int64-throwingop-int64-throwingpow.md)。

### 签名

```cangjie role=signature
public func throwingShl(y: UInt64): Int64
```

使用抛出异常策略的左移运算。

### 契约

当移位位数大于等于操作数位数时，抛出异常，否则返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- Int64 - 左移运算结果。

异常：

- OvershiftException - 当移位位数大于等于操作数位数时，抛出异常。

## func throwingShl(UInt64)

适用扩展：[extend Int8 <: ThrowingOp<Int8>](extensions/extend-int8-throwingop-int8.md)。

### 签名

```cangjie role=signature
public func throwingShl(y: UInt64): Int8
```

使用抛出异常策略的左移运算。

### 契约

当移位位数大于等于操作数位数时，抛出异常，否则返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- Int8 - 左移运算结果。

异常：

- OvershiftException - 当移位位数大于等于操作数位数时，抛出异常。

## func throwingShl(UInt64)

适用扩展：[extend IntNative <: ThrowingOp<IntNative>](extensions/extend-intnative-throwingop-intnative.md)。

### 签名

```cangjie role=signature
public func throwingShl(y: UInt64): IntNative
```

使用抛出异常策略的左移运算。

### 契约

当移位位数大于等于操作数位数时，抛出异常，否则返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- IntNative - 左移运算结果。

异常：

- OvershiftException - 当移位位数大于等于操作数位数时，抛出异常。

## func throwingShl(UInt64)

适用扩展：[extend UInt16 <: ThrowingOp<UInt16>](extensions/extend-uint16-throwingop-uint16.md)。

### 签名

```cangjie role=signature
public func throwingShl(y: UInt64): UInt16
```

使用抛出异常策略的左移运算。

### 契约

当移位位数大于等于操作数位数时，抛出异常，否则返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- UInt16 - 左移运算结果。

异常：

- OvershiftException - 当移位位数大于等于操作数位数时，抛出异常。

## func throwingShl(UInt64)

适用扩展：[extend UInt32 <: ThrowingOp<UInt32>](extensions/extend-uint32-throwingop-uint32.md)。

### 签名

```cangjie role=signature
public func throwingShl(y: UInt64): UInt32
```

使用抛出异常策略的左移运算。

### 契约

当移位位数大于等于操作数位数时，抛出异常，否则返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- UInt32 - 左移运算结果。

异常：

- OvershiftException - 当移位位数大于等于操作数位数时，抛出异常。

## func throwingShl(UInt64)

适用扩展：[extend UInt64 <: ThrowingOp<UInt64>](extensions/extend-uint64-throwingop-uint64.md)。

### 签名

```cangjie role=signature
public func throwingShl(y: UInt64): UInt64
```

使用抛出异常策略的左移运算。

### 契约

当移位位数大于等于操作数位数时，抛出异常，否则返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- UInt64 - 左移运算结果。

异常：

- OvershiftException - 当移位位数大于等于操作数位数时，抛出异常。

## func throwingShl(UInt64)

适用扩展：[extend UInt8 <: ThrowingOp<UInt8>](extensions/extend-uint8-throwingop-uint8.md)。

### 签名

```cangjie role=signature
public func throwingShl(y: UInt64): UInt8
```

使用抛出异常策略的左移运算。

### 契约

当移位位数大于等于操作数位数时，抛出异常，否则返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- UInt8 - 左移运算结果。

异常：

- OvershiftException - 当移位位数大于等于操作数位数时，抛出异常。

## func throwingShl(UInt64)

适用扩展：[extend UIntNative <: ThrowingOp<UIntNative>](extensions/extend-uintnative-throwingop-uintnative.md)。

### 签名

```cangjie role=signature
public func throwingShl(y: UInt64): UIntNative
```

使用抛出异常策略的左移运算。

### 契约

当移位位数大于等于操作数位数时，抛出异常，否则返回运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- UIntNative - 左移运算结果。

异常：

- OvershiftException - 当移位位数大于等于操作数位数时，抛出异常。
