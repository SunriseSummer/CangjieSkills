<!-- cj-doc kind="api-member" level="6" id="std.unittest.interface.nearequatable.isnear" parent="std.unittest.interface.nearequatable" -->
# NearEquatable<CT, D>.isNear

[← NearEquatable<CT, D>](index.md)

本页汇总 7 个同名重载；先按签名选择，再读取对应契约。

## func isNear(CT, D)

### 签名

```cangjie role=signature
public func isNear(obj: CT, delta!: D): Bool
```

判断某个对象是否基于这个 delta 近似相等。

### 契约

参数：

- obj: CT - 被比较的对象。
- delta!: D - 判断近似相等的 delta。

返回值：

- Bool - 是否近似相等。

## func isNear(Float16, Float16)

适用扩展：[extend Float16 <: NearEquatable<Float16, Float16>](extensions/extend-float16-nearequatable-float16-float16.md)。

### 签名

```cangjie role=signature
public func isNear(obj: Float16, delta!: Float16): Bool
```

判断某个对象是否基于这个 delta 近似相等。

### 契约

参数：

- obj: Float16 - 被比较的对象。
- delta!: Float16 - 判断近似相等的 delta。

返回值：

- Bool - 是否近似相等。

异常：

- IllegalArgumentException - delta 值不能为负数，且不是 NaN, 否则将抛出该异常。

## func isNear(Float16, RelativeDelta<Float16>)

适用扩展：[extend Float16 <: NearEquatable<Float16, RelativeDelta<Float16>>](extensions/extend-float16-nearequatable-float16-relativedelta-float16.md)。

### 签名

```cangjie role=signature
public func isNear(obj: Float16, delta!: RelativeDelta<Float16>): Bool
```

判断某个对象是否基于这个 delta 近似相等。

### 契约

参数：

- obj: Float16 - 被比较的对象。
- delta!: RelativeDelta\<Float16> - 判断近似相等的 delta。

返回值：

- Bool - 是否近似相等。

异常：

- IllegalArgumentException - delta 值不能为负数，且不是 NaN，否则将抛出该异常。

## func isNear(Float32, Float32)

适用扩展：[extend Float32 <: NearEquatable<Float32, Float32>](extensions/extend-float32-nearequatable-float32-float32.md)。

### 签名

```cangjie role=signature
public func isNear(obj: Float32, delta!: Float32): Bool
```

判断某个对象是否基于这个 delta 近似相等。

### 契约

参数：

- obj: Float32 - 被比较的对象。
- delta!: Float32 - 判断近似相等的 delta。

返回值：

- Bool - 是否近似相等。

异常：

- IllegalArgumentException - delta 值不能为负数，且不是 NaN，否则将抛出该异常。

## func isNear(Float32, RelativeDelta<Float32>)

适用扩展：[extend Float32 <: NearEquatable<Float32, RelativeDelta<Float32>>](extensions/extend-float32-nearequatable-float32-relativedelta-float32.md)。

### 签名

```cangjie role=signature
public func isNear(obj: Float32, delta!: RelativeDelta<Float32>): Bool
```

判断某个对象是否基于这个 delta 近似相等。

### 契约

参数：

- obj: Float32 - 被比较的对象。
- delta!: RelativeDelta\<Float32> - 判断近似相等的 delta。

返回值：

- Bool - 是否近似相等。

异常：

- IllegalArgumentException - delta 值不能为负数，且不是 NaN，否则将抛出该异常。

## func isNear(Float64, Float64)

适用扩展：[extend Float64 <: NearEquatable<Float64, Float64>](extensions/extend-float64-nearequatable-float64-float64.md)。

### 签名

```cangjie role=signature
public func isNear(obj: Float64, delta!: Float64): Bool
```

判断某个对象是否基于这个 delta 近似相等。

### 契约

参数：

- obj: Float64 - 被比较的对象。
- delta!: Float64 - 判断近似相等的 delta。

返回值：

- Bool - 是否近似相等。

异常：

- IllegalArgumentException - delta 值不能为负数，且不是 NaN，否则将抛出该异常。

## func isNear(Float64, RelativeDelta<Float64>)

适用扩展：[extend Float64 <: NearEquatable<Float64, RelativeDelta<Float64>>](extensions/extend-float64-nearequatable-float64-relativedelta-float64.md)。

### 签名

```cangjie role=signature
public func isNear(obj: Float64, delta!: RelativeDelta<Float64>): Bool
```

判断某个对象是否基于这个 delta 近似相等。

### 契约

参数：

- obj: Float64 - 被比较的对象。
- delta!: RelativeDelta\<Float64> - 判断近似相等的 delta。

返回值：

- Bool - 是否近似相等。

异常：

- IllegalArgumentException - delta 值不能为负数，且不是 NaN，否则将抛出该异常。
