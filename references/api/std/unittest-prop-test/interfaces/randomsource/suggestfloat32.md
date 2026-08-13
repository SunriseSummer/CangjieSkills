<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.suggestfloat32" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.suggestFloat32

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func suggestFloat32()

### 签名

```cangjie role=signature
public open func suggestFloat32(): Float32
```

获取一个 Float32 类型的伪随机数，其范围为 [0.0, 1.0)。

### 契约

返回值：

- Float32 - 一个 Float32 类型的伪随机数。

## func suggestFloat32(Float32, Float32)

### 签名

```cangjie role=signature
func suggestFloat32(l: Float32, r: Float32): Float32
```

获取一个 Float32 类型的伪随机数。

### 契约

参数：

- l: Float32 - 可生成范围的最小值。
- l: Float32 - 可生成范围的最大值。

返回值：

- Float32 - 一个 Float32 类型的伪随机数。

## func suggestFloat32()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func suggestFloat32(): Float32
```

获取一个 Float32 类型的伪随机数，其范围为 [0.0, 1.0)。

### 契约

返回值：

- Float32 - 一个 Float32 类型的伪随机数。

## func suggestFloat32(Float32, Float32)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
func suggestFloat32(l: Float32, r: Float32): Float32
```

获取一个 Float32 类型的伪随机数。

### 契约

参数：

- l: Float32 - 可生成范围的最小值。
- l: Float32 - 可生成范围的最大值。

返回值：

- Float32 - 一个 Float32 类型的伪随机数。
