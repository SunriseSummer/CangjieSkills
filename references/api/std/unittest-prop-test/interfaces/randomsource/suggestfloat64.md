<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.suggestfloat64" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.suggestFloat64

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func suggestFloat64()

### 签名

```cangjie role=signature
public open func suggestFloat64(): Float64
```

获取一个 Float64 类型的伪随机数，其范围为 [0.0, 1.0)。

### 契约

返回值：

- Float64 - 一个 Float64 类型的伪随机数。

## func suggestFloat64(Float64, Float64)

### 签名

```cangjie role=signature
func suggestFloat64(l: Float64, r: Float64): Float64
```

获取一个 Float64 类型的伪随机数。

### 契约

参数：

- l: Float64 - 可生成范围的最小值。
- l: Float64 - 可生成范围的最大值。

返回值：

- Float64 - 一个 Float64 类型的伪随机数。

## func suggestFloat64()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func suggestFloat64(): Float64
```

获取一个 Float64 类型的伪随机数，其范围为 [0.0, 1.0)。

### 契约

返回值：

- Float64 - 一个 Float64 类型的伪随机数。

## func suggestFloat64(Float64, Float64)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
func suggestFloat64(l: Float64, r: Float64): Float64
```

获取一个 Float64 类型的伪随机数。

### 契约

参数：

- l: Float64 - 可生成范围的最小值。
- l: Float64 - 可生成范围的最大值。

返回值：

- Float64 - 一个 Float64 类型的伪随机数。
