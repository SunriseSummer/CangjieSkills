<!-- cj-doc kind="api-member" level="6" id="std.overflow.interface.saturatingop.saturatingneg" parent="std.overflow.interface.saturatingop" -->
# SaturatingOp<T>.saturatingNeg

[← SaturatingOp<T>](index.md)

本页汇总 11 个同名重载；先按签名选择，再读取对应契约。

## func saturatingNeg()

### 签名

```cangjie role=signature
func saturatingNeg(): T
```

使用饱和策略的负号运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

返回值：

- T - 负号运算结果。

## func saturatingNeg()

适用扩展：[extend Int16 <: SaturatingOp<Int16>](extensions/extend-int16-saturatingop-int16.md)。

### 签名

```cangjie role=signature
public func saturatingNeg(): Int16
```

使用饱和策略的负号运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

返回值：

- Int16 - 负号运算结果。

## func saturatingNeg()

适用扩展：[extend Int32 <: SaturatingOp<Int32>](extensions/extend-int32-saturatingop-int32.md)。

### 签名

```cangjie role=signature
public func saturatingNeg(): Int32
```

使用饱和策略的负号运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

返回值：

- Int32 - 负号运算结果。

## func saturatingNeg()

适用扩展：[extend Int64 <: SaturatingOp<Int64> & SaturatingPow](extensions/extend-int64-saturatingop-int64-saturatingpow.md)。

### 签名

```cangjie role=signature
public func saturatingNeg(): Int64
```

使用饱和策略的负号运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

返回值：

- Int64 - 负号运算结果。

## func saturatingNeg()

适用扩展：[extend Int8 <: SaturatingOp<Int8>](extensions/extend-int8-saturatingop-int8.md)。

### 签名

```cangjie role=signature
public func saturatingNeg(): Int8
```

使用饱和策略的负号运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

返回值：

- Int8 - 负号运算结果。

## func saturatingNeg()

适用扩展：[extend IntNative <: SaturatingOp<IntNative>](extensions/extend-intnative-saturatingop-intnative.md)。

### 签名

```cangjie role=signature
public func saturatingNeg(): IntNative
```

使用饱和策略的负号运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

返回值：

- IntNative - 负号运算结果。

## func saturatingNeg()

适用扩展：[extend UInt16 <: SaturatingOp<UInt16>](extensions/extend-uint16-saturatingop-uint16.md)。

### 签名

```cangjie role=signature
public func saturatingNeg(): UInt16
```

使用饱和策略的负号运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

返回值：

- UInt16 - 负号运算结果。

## func saturatingNeg()

适用扩展：[extend UInt32 <: SaturatingOp<UInt32>](extensions/extend-uint32-saturatingop-uint32.md)。

### 签名

```cangjie role=signature
public func saturatingNeg(): UInt32
```

使用饱和策略的负号运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

返回值：

- UInt32 - 负号运算结果。

## func saturatingNeg()

适用扩展：[extend UInt64 <: SaturatingOp<UInt64>](extensions/extend-uint64-saturatingop-uint64.md)。

### 签名

```cangjie role=signature
public func saturatingNeg(): UInt64
```

使用饱和策略的负号运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

返回值：

- UInt64 - 负号运算结果。

## func saturatingNeg()

适用扩展：[extend UInt8 <: SaturatingOp<UInt8>](extensions/extend-uint8-saturatingop-uint8.md)。

### 签名

```cangjie role=signature
public func saturatingNeg(): UInt8
```

使用饱和策略的负号运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

返回值：

- UInt8 - 负号运算结果。

## func saturatingNeg()

适用扩展：[extend UIntNative <: SaturatingOp<UIntNative>](extensions/extend-uintnative-saturatingop-uintnative.md)。

### 签名

```cangjie role=signature
public func saturatingNeg(): UIntNative
```

使用饱和策略的负号运算。

### 契约

当运算出现上溢时，返回操作数类型的最大值，运算出现下溢时，返回操作数类型的最小值，否则返回运算结果。

返回值：

- UIntNative - 负号运算结果。
