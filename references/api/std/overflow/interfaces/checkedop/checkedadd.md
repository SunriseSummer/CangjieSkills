<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.checkedop.checkedadd" parent="std.overflow.interface.checkedop" -->
# CheckedOp<T>.checkedAdd

[← CheckedOp<T>](index.md)

本页汇总 11 个同名重载；先按签名选择，再读取对应契约。

## func checkedAdd(T)

### 签名

```cangjie role=signature
func checkedAdd(y: T): ?T
```

使用返回 Option 策略的加法运算。

### 契约

当运算出现溢出时，返回 `?T.None`，否则返回运算结果。

参数：

- y: T - 加数。

返回值：

- ?T - 加法运算结果。

## func checkedAdd(Int16)

适用扩展：[extend Int16 <: CheckedOp<Int16>](extensions/extend-int16-checkedop-int16.md)。

### 签名

```cangjie role=signature
public func checkedAdd(y: Int16): ?Int16
```

使用返回 Option 策略的加法运算。

### 契约

当运算出现溢出时，返回 ?Int16.None，否则返回运算结果。

参数：

- y: Int16 - 加数。

返回值：

- ?Int16 - 加法运算结果。

## func checkedAdd(Int32)

适用扩展：[extend Int32 <: CheckedOp<Int32>](extensions/extend-int32-checkedop-int32.md)。

### 签名

```cangjie role=signature
public func checkedAdd(y: Int32): ?Int32
```

使用返回 Option 策略的加法运算。

### 契约

当运算出现溢出时，返回 ?Int32.None，否则返回运算结果。

参数：

- y: Int32 - 加数。

返回值：

- ?Int32 - 加法运算结果。

## func checkedAdd(Int64)

适用扩展：[extend Int64 <: CheckedOp<Int64> & CheckedPow](extensions/extend-int64-checkedop-int64-checkedpow.md)。

### 签名

```cangjie role=signature
public func checkedAdd(y: Int64): ?Int64
```

使用返回 Option 策略的加法运算。

### 契约

当运算出现溢出时，返回 ?Int64.None，否则返回运算结果。

参数：

- y: Int64 - 加数。

返回值：

- ?Int64 - 加法运算结果。

## func checkedAdd(Int8)

适用扩展：[extend Int8 <: CheckedOp<Int8>](extensions/extend-int8-checkedop-int8.md)。

### 签名

```cangjie role=signature
public func checkedAdd(y: Int8): ?Int8
```

使用返回 Option 策略的加法运算。

### 契约

当运算出现溢出时，返回 ?Int8.None，否则返回运算结果。

参数：

- y: Int8 - 加数。

返回值：

- ?Int8 - 加法运算结果。

## func checkedAdd(IntNative)

适用扩展：[extend IntNative <: CheckedOp<IntNative>](extensions/extend-intnative-checkedop-intnative.md)。

### 签名

```cangjie role=signature
public func checkedAdd(y: IntNative): ?IntNative
```

使用返回 Option 策略的加法运算。

### 契约

当运算出现溢出时，返回 ?IntNative.None，否则返回运算结果。

参数：

- y: IntNative - 加数。

返回值：

- ?IntNative - 加法运算结果。

## func checkedAdd(UInt16)

适用扩展：[extend UInt16 <: CheckedOp<UInt16>](extensions/extend-uint16-checkedop-uint16.md)。

### 签名

```cangjie role=signature
public func checkedAdd(y: UInt16): ?UInt16
```

使用返回 Option 策略的加法运算。

### 契约

当运算出现溢出时，返回 ?UInt16.None，否则返回运算结果。

参数：

- y: UInt16 - 加数。

返回值：

- ?UInt16 - 加法运算结果。

## func checkedAdd(UInt32)

适用扩展：[extend UInt32 <: CheckedOp<UInt32>](extensions/extend-uint32-checkedop-uint32.md)。

### 签名

```cangjie role=signature
public func checkedAdd(y: UInt32): ?UInt32
```

使用返回 Option 策略的加法运算。

### 契约

当运算出现溢出时，返回 ?UInt32.None，否则返回运算结果。

参数：

- y: UInt32 - 加数。

返回值：

- ?UInt32 - 加法运算结果。

## func checkedAdd(UInt64)

适用扩展：[extend UInt64 <: CheckedOp<UInt64>](extensions/extend-uint64-checkedop-uint64.md)。

### 签名

```cangjie role=signature
public func checkedAdd(y: UInt64): ?UInt64
```

使用返回 Option 策略的加法运算。

### 契约

当运算出现溢出时，返回 ?UInt64.None，否则返回运算结果。

参数：

- y: UInt64 - 加数。

返回值：

- ?UInt64 - 加法运算结果。

## func checkedAdd(UInt8)

适用扩展：[extend UInt8 <: CheckedOp<UInt8>](extensions/extend-uint8-checkedop-uint8.md)。

### 签名

```cangjie role=signature
public func checkedAdd(y: UInt8): ?UInt8
```

使用返回 Option 策略的加法运算。

### 契约

当运算出现溢出时，返回 ?UInt8.None，否则返回运算结果。

参数：

- y: UInt8 - 加数。

返回值：

- ?UInt8 - 加法运算结果。

## func checkedAdd(UIntNative)

适用扩展：[extend UIntNative <: CheckedOp<UIntNative>](extensions/extend-uintnative-checkedop-uintnative.md)。

### 签名

```cangjie role=signature
public func checkedAdd(y: UIntNative): ?UIntNative
```

使用返回 Option 策略的加法运算。

### 契约

当运算出现溢出时，返回 ?UIntNative.None，否则返回运算结果。

参数：

- y: UIntNative - 加数。

返回值：

- ?UIntNative - 加法运算结果。
