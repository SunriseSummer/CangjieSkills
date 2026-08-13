<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.suggestuint8" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.suggestUInt8

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func suggestUInt8()

### 签名

```cangjie role=signature
public open func suggestUInt8(): UInt8
```

获取一个 UInt8 类型的伪随机数。

### 契约

返回值：

- UInt8 - 一个 UInt8 类型的伪随机数。

## func suggestUInt8(UInt8, UInt8)

### 签名

```cangjie role=signature
func suggestUInt8(l: UInt8, r: UInt8): UInt8
```

获取一个 UInt8 类型的伪随机数。

### 契约

参数：

- l: UInt8 - 可生成范围的最小值。
- r: UInt8 - 可生成范围的最大值。

返回值：

- UInt8 - 一个 UInt8 类型的伪随机数。

## func suggestUInt8()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func suggestUInt8(): UInt8
```

获取一个 UInt8 类型的伪随机数。

### 契约

返回值：

- UInt8 - 一个 UInt8 类型的伪随机数。

## func suggestUInt8(UInt8, UInt8)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
func suggestUInt8(l: UInt8, r: UInt8): UInt8
```

获取一个 UInt8 类型的伪随机数。

### 契约

参数：

- l: UInt8 - 可生成范围的最小值。
- r: UInt8 - 可生成范围的最大值。

返回值：

- UInt8 - 一个 UInt8 类型的伪随机数。
