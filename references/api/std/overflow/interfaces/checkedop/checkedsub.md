<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.checkedop.checkedsub" parent="std.overflow.interface.checkedop" -->
# CheckedOp<T>.checkedSub

[← CheckedOp<T>](index.md)

本页汇总 11 个同名重载；先按签名选择，再读取对应契约。

## func checkedSub(T)

### 签名

```cangjie role=signature
func checkedSub(y: T): ?T
```

使用返回 Option 策略的减法运算。

### 契约

当运算出现溢出时，返回 `?T.None`，否则返回运算结果。

参数：

- y: T - 减数。

返回值：

- ?T - 减法运算结果。

## func checkedSub(Int16)

适用扩展：[extend Int16 <: CheckedOp<Int16>](extensions/extend-int16-checkedop-int16.md)。

### 签名

```cangjie role=signature
public func checkedSub(y: Int16): ?Int16
```

使用返回 Option 策略的减法运算。

### 契约

当运算出现溢出时，返回 ?Int16.None，否则返回运算结果。

参数：

- y: Int16 - 减数。

返回值：

- ?Int16 - 减法运算结果。

## func checkedSub(Int32)

适用扩展：[extend Int32 <: CheckedOp<Int32>](extensions/extend-int32-checkedop-int32.md)。

### 签名

```cangjie role=signature
public func checkedSub(y: Int32): ?Int32
```

使用返回 Option 策略的减法运算。

### 契约

当运算出现溢出时，返回 ?Int32.None，否则返回运算结果。

参数：

- y: Int32 - 减数。

返回值：

- ?Int32 - 减法运算结果。

## func checkedSub(Int64)

适用扩展：[extend Int64 <: CheckedOp<Int64> & CheckedPow](extensions/extend-int64-checkedop-int64-checkedpow.md)。

### 签名

```cangjie role=signature
public func checkedSub(y: Int64): ?Int64
```

使用返回 Option 策略的减法运算。

### 契约

当运算出现溢出时，返回 ?Int64.None，否则返回运算结果。

参数：

- y: Int64 - 减数。

返回值：

- ?Int64 - 减法运算结果。

## func checkedSub(Int8)

适用扩展：[extend Int8 <: CheckedOp<Int8>](extensions/extend-int8-checkedop-int8.md)。

### 签名

```cangjie role=signature
public func checkedSub(y: Int8): ?Int8
```

使用返回 Option 策略的减法运算。

### 契约

当运算出现溢出时，返回 ?Int8.None，否则返回运算结果。

参数：

- y: Int8 - 减数。

返回值：

- ?Int8 - 减法运算结果。

## func checkedSub(IntNative)

适用扩展：[extend IntNative <: CheckedOp<IntNative>](extensions/extend-intnative-checkedop-intnative.md)。

### 签名

```cangjie role=signature
public func checkedSub(y: IntNative): ?IntNative
```

使用返回 Option 策略的减法运算。

### 契约

当运算出现溢出时，返回 ?IntNative.None，否则返回运算结果。

参数：

- y: IntNative - 减数。

返回值：

- ?IntNative - 减法运算结果。

## func checkedSub(UInt16)

适用扩展：[extend UInt16 <: CheckedOp<UInt16>](extensions/extend-uint16-checkedop-uint16.md)。

### 签名

```cangjie role=signature
public func checkedSub(y: UInt16): ?UInt16
```

使用返回 Option 策略的减法运算。

### 契约

当运算出现溢出时，返回 ?UInt16.None，否则返回运算结果。

参数：

- y: UInt16 - 减数。

返回值：

- ?UInt16 - 减法运算结果。

## func checkedSub(UInt32)

适用扩展：[extend UInt32 <: CheckedOp<UInt32>](extensions/extend-uint32-checkedop-uint32.md)。

### 签名

```cangjie role=signature
public func checkedSub(y: UInt32): ?UInt32
```

使用返回 Option 策略的减法运算。

### 契约

当运算出现溢出时，返回 ?UInt32.None，否则返回运算结果。

参数：

- y: UInt32 - 减数。

返回值：

- ?UInt32 - 减法运算结果。

## func checkedSub(UInt64)

适用扩展：[extend UInt64 <: CheckedOp<UInt64>](extensions/extend-uint64-checkedop-uint64.md)。

### 签名

```cangjie role=signature
public func checkedSub(y: UInt64): ?UInt64
```

使用返回 Option 策略的减法运算。

### 契约

当运算出现溢出时，返回 ?UInt64.None，否则返回运算结果。

参数：

- y: UInt64 - 减数。

返回值：

- ?UInt64 - 减法运算结果。

## func checkedSub(UInt8)

适用扩展：[extend UInt8 <: CheckedOp<UInt8>](extensions/extend-uint8-checkedop-uint8.md)。

### 签名

```cangjie role=signature
public func checkedSub(y: UInt8): ?UInt8
```

使用返回 Option 策略的减法运算。

### 契约

当运算出现溢出时，返回 ?UInt8.None，否则返回运算结果。

参数：

- y: UInt8 - 减数。

返回值：

- ?UInt8 - 减法运算结果。

## func checkedSub(UIntNative)

适用扩展：[extend UIntNative <: CheckedOp<UIntNative>](extensions/extend-uintnative-checkedop-uintnative.md)。

### 签名

```cangjie role=signature
public func checkedSub(y: UIntNative): ?UIntNative
```

使用返回 Option 策略的减法运算。

### 契约

当运算出现溢出时，返回 ?UIntNative.None，否则返回运算结果。

参数：

- y: UIntNative - 减数。

返回值：

- ?UIntNative - 减法运算结果。
