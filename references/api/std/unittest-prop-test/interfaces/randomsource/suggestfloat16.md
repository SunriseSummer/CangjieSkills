<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.suggestfloat16" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.suggestFloat16

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func suggestFloat16()

### 签名

```cangjie role=signature
public open func suggestFloat16(): Float16
```

获取一个 Float16 类型的伪随机数，其范围为 [0.0, 1.0)。

### 契约

返回值：

- Float16 - 一个 Float16 类型的伪随机数。

## func suggestFloat16(Float16, Float16)

### 签名

```cangjie role=signature
func suggestFloat16(l: Float16, r: Float16): Float16
```

获取一个 Float16 类型的伪随机数。

### 契约

参数：

- l: Float16 - 可生成范围的最小值。
- l: Float16 - 可生成范围的最大值。

返回值：

- Float16 - 一个 Float16 类型的伪随机数。

## func suggestFloat16()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func suggestFloat16(): Float16
```

获取一个 Float16 类型的伪随机数，其范围为 [0.0, 1.0)。

### 契约

返回值：

- Float16 - 一个 Float16 类型的伪随机数。

## func suggestFloat16(Float16, Float16)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
func suggestFloat16(l: Float16, r: Float16): Float16
```

获取一个 Float16 类型的伪随机数。

### 契约

参数：

- l: Float16 - 可生成范围的最小值。
- l: Float16 - 可生成范围的最大值。

返回值：

- Float16 - 一个 Float16 类型的伪随机数。
