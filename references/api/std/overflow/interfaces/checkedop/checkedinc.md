<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.checkedop.checkedinc" parent="std.overflow.interface.checkedop" -->
# CheckedOp<T>.checkedInc

[← CheckedOp<T>](index.md)

本页汇总 11 个同名重载；先按签名选择，再读取对应契约。

## func checkedInc()

### 签名

```cangjie role=signature
func checkedInc(): ?T
```

使用返回 Option 策略的自增运算。

### 契约

当运算出现溢出时，返回 `?T.None`，否则返回运算结果。

返回值：

- ?T - 自增运算结果。

## func checkedInc()

适用扩展：[extend Int16 <: CheckedOp<Int16>](extensions/extend-int16-checkedop-int16.md)。

### 签名

```cangjie role=signature
public func checkedInc(): ?Int16
```

使用返回 Option 策略的自增运算。

### 契约

当运算出现溢出时，返回 ?Int16.None，否则返回运算结果。

返回值：

- ?Int16 - 自增运算结果。

## func checkedInc()

适用扩展：[extend Int32 <: CheckedOp<Int32>](extensions/extend-int32-checkedop-int32.md)。

### 签名

```cangjie role=signature
public func checkedInc(): ?Int32
```

使用返回 Option 策略的自增运算。

### 契约

当运算出现溢出时，返回 ?Int32.None，否则返回运算结果。

返回值：

- ?Int32 - 自增运算结果。

## func checkedInc()

适用扩展：[extend Int64 <: CheckedOp<Int64> & CheckedPow](extensions/extend-int64-checkedop-int64-checkedpow.md)。

### 签名

```cangjie role=signature
public func checkedInc(): ?Int64
```

使用返回 Option 策略的自增运算。

### 契约

当运算出现溢出时，返回 ?Int64.None，否则返回运算结果。

返回值：

- ?Int64 - 自增运算结果。

## func checkedInc()

适用扩展：[extend Int8 <: CheckedOp<Int8>](extensions/extend-int8-checkedop-int8.md)。

### 签名

```cangjie role=signature
public func checkedInc(): ?Int8
```

使用返回 Option 策略的自增运算。

### 契约

当运算出现溢出时，返回 ?Int8.None，否则返回运算结果。

返回值：

- ?Int8 - 自增运算结果。

## func checkedInc()

适用扩展：[extend IntNative <: CheckedOp<IntNative>](extensions/extend-intnative-checkedop-intnative.md)。

### 签名

```cangjie role=signature
public func checkedInc(): ?IntNative
```

使用返回 Option 策略的自增运算。

### 契约

当运算出现溢出时，返回 ?IntNative.None，否则返回运算结果。

返回值：

- ?IntNative - 自增运算结果。

## func checkedInc()

适用扩展：[extend UInt16 <: CheckedOp<UInt16>](extensions/extend-uint16-checkedop-uint16.md)。

### 签名

```cangjie role=signature
public func checkedInc(): ?UInt16
```

使用返回 Option 策略的自增运算。

### 契约

当运算出现溢出时，返回 ?UInt16.None，否则返回运算结果。

返回值：

- ?UInt16 - 自增运算结果。

## func checkedInc()

适用扩展：[extend UInt32 <: CheckedOp<UInt32>](extensions/extend-uint32-checkedop-uint32.md)。

### 签名

```cangjie role=signature
public func checkedInc(): ?UInt32
```

使用返回 Option 策略的自增运算。

### 契约

当运算出现溢出时，返回 ?UInt32.None，否则返回运算结果。

返回值：

- ?UInt32 - 自增运算结果。

## func checkedInc()

适用扩展：[extend UInt64 <: CheckedOp<UInt64>](extensions/extend-uint64-checkedop-uint64.md)。

### 签名

```cangjie role=signature
public func checkedInc(): ?UInt64
```

使用返回 Option 策略的自增运算。

### 契约

当运算出现溢出时，返回 ?UInt64.None，否则返回运算结果。

返回值：

- ?UInt64 - 自增运算结果。

## func checkedInc()

适用扩展：[extend UInt8 <: CheckedOp<UInt8>](extensions/extend-uint8-checkedop-uint8.md)。

### 签名

```cangjie role=signature
public func checkedInc(): ?UInt8
```

使用返回 Option 策略的自增运算。

### 契约

当运算出现溢出时，返回 ?UInt8.None，否则返回运算结果。

返回值：

- ?UInt8 - 自增运算结果。

## func checkedInc()

适用扩展：[extend UIntNative <: CheckedOp<UIntNative>](extensions/extend-uintnative-checkedop-uintnative.md)。

### 签名

```cangjie role=signature
public func checkedInc(): ?UIntNative
```

使用返回 Option 策略的自增运算。

### 契约

当运算出现溢出时，返回 ?UIntNative.None，否则返回运算结果。

返回值：

- ?UIntNative - 自增运算结果。
