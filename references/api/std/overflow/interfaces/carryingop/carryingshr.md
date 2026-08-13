<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.carryingop.carryingshr" parent="std.overflow.interface.carryingop" -->
# CarryingOp<T>.carryingShr

[← CarryingOp<T>](index.md)

本页汇总 11 个同名重载；先按签名选择，再读取对应契约。

## func carryingShr(UInt64)

### 签名

```cangjie role=signature
func carryingShr(y: UInt64): (Bool, T)
```

返回一个元组，元组的第一个元素表示右移运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。

### 契约

参数：

- y: UInt64 - 移位位数。

返回值：

- (Bool, T) - 右移运算是否发生截断以及运算的结果。

## func carryingShr(UInt64)

适用扩展：[extend Int16 <: CarryingOp<Int16>](extensions/extend-int16-carryingop-int16.md)。

### 签名

```cangjie role=signature
public func carryingShr(y: UInt64): (Bool, Int16)
```

使用 wrapping 策略的右移运算。

### 契约

当运算出现溢出时，返回 `true` 和运算结果，否则返回 `false` 和运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- (Bool, Int16) - 返回一个元组，元组的第一个元素表示运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。

## func carryingShr(UInt64)

适用扩展：[extend Int32 <: CarryingOp<Int32>](extensions/extend-int32-carryingop-int32.md)。

### 签名

```cangjie role=signature
public func carryingShr(y: UInt64): (Bool, Int32)
```

使用 wrapping 策略的右移运算。

### 契约

当运算出现溢出时，返回 `true` 和运算结果，否则返回 `false` 和运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- (Bool, Int32) - 返回一个元组，元组的第一个元素表示运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。

## func carryingShr(UInt64)

适用扩展：[extend Int64 <: CarryingOp<Int64> & CarryingPow](extensions/extend-int64-carryingop-int64-carryingpow.md)。

### 签名

```cangjie role=signature
public func carryingShr(y: UInt64): (Bool, Int64)
```

使用 wrapping 策略的右移运算。

### 契约

当运算出现溢出时，返回 `true` 和运算结果，否则返回 `false` 和运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- (Bool, Int64) - 返回一个元组，元组的第一个元素表示运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。

## func carryingShr(UInt64)

适用扩展：[extend Int8 <: CarryingOp<Int8>](extensions/extend-int8-carryingop-int8.md)。

### 签名

```cangjie role=signature
public func carryingShr(y: UInt64): (Bool, Int8)
```

使用 wrapping 策略的右移运算。

### 契约

当运算出现溢出时，返回 `true` 和运算结果，否则返回 `false` 和运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- (Bool, Int8) - 返回一个元组，元组的第一个元素表示运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。

## func carryingShr(UInt64)

适用扩展：[extend IntNative <: CarryingOp<IntNative>](extensions/extend-intnative-carryingop-intnative.md)。

### 签名

```cangjie role=signature
public func carryingShr(y: UInt64): (Bool, IntNative)
```

使用 wrapping 策略的右移运算。

### 契约

当运算出现溢出时，返回 `true` 和运算结果，否则返回 `false` 和运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- (Bool, IntNative) - 返回一个元组，元组的第一个元素表示运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。

## func carryingShr(UInt64)

适用扩展：[extend UInt16 <: CarryingOp<UInt16>](extensions/extend-uint16-carryingop-uint16.md)。

### 签名

```cangjie role=signature
public func carryingShr(y: UInt64): (Bool, UInt16)
```

使用 wrapping 策略的右移运算。

### 契约

当运算出现溢出时，返回 `true` 和运算结果，否则返回 `false` 和运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- (Bool, UInt16) - 返回一个元组，元组的第一个元素表示运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。

## func carryingShr(UInt64)

适用扩展：[extend UInt32 <: CarryingOp<UInt32>](extensions/extend-uint32-carryingop-uint32.md)。

### 签名

```cangjie role=signature
public func carryingShr(y: UInt64): (Bool, UInt32)
```

使用 wrapping 策略的右移运算。

### 契约

当运算出现溢出时，返回 `true` 和运算结果，否则返回 `false` 和运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- (Bool, UInt32) - 返回一个元组，元组的第一个元素表示运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。

## func carryingShr(UInt64)

适用扩展：[extend UInt64 <: CarryingOp<UInt64>](extensions/extend-uint64-carryingop-uint64.md)。

### 签名

```cangjie role=signature
public func carryingShr(y: UInt64): (Bool, UInt64)
```

使用 wrapping 策略的右移运算。

### 契约

当运算出现溢出时，返回 `true` 和运算结果，否则返回 `false` 和运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- (Bool, UInt64) - 返回一个元组，元组的第一个元素表示运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。

## func carryingShr(UInt64)

适用扩展：[extend UInt8 <: CarryingOp<UInt8>](extensions/extend-uint8-carryingop-uint8.md)。

### 签名

```cangjie role=signature
public func carryingShr(y: UInt64): (Bool, UInt8)
```

使用 wrapping 策略的右移运算。

### 契约

当运算出现溢出时，返回 `true` 和运算结果，否则返回 `false` 和运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- (Bool, UInt8) - 返回一个元组，元组的第一个元素表示运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。

## func carryingShr(UInt64)

适用扩展：[extend UIntNative <: CarryingOp<UIntNative>](extensions/extend-uintnative-carryingop-uintnative.md)。

### 签名

```cangjie role=signature
public func carryingShr(y: UInt64): (Bool, UIntNative)
```

使用 wrapping 策略的右移运算。

### 契约

当运算出现溢出时，返回 `true` 和运算结果，否则返回 `false` 和运算结果。

参数：

- y: UInt64 - 移位位数。

返回值：

- (Bool, UIntNative) - 返回一个元组，元组的第一个元素表示运算是否发生了截断，发生截断时为 `true`，元组的第二个元素是运算的结果。
