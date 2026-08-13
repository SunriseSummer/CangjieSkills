<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.suggestuint16" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.suggestUInt16

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func suggestUInt16()

### 签名

```cangjie role=signature
public open func suggestUInt16(): UInt16
```

获取一个 UInt16 类型的伪随机数。

### 契约

返回值：

- UInt16 - 一个 UInt16 类型的伪随机数。

## func suggestUInt16(UInt16, UInt16)

### 签名

```cangjie role=signature
func suggestUInt16(l: UInt16, r: UInt16): UInt16
```

获取一个 UInt16 类型的伪随机数。

### 契约

参数：

- l: UInt16 - 可生成范围的最小值。
- r: UInt16 - 可生成范围的最大值。

返回值：

- UInt16 - 一个 UInt16 类型的伪随机数。

## func suggestUInt16()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func suggestUInt16(): UInt16
```

获取一个 UInt16 类型的伪随机数。

### 契约

返回值：

- UInt16 - 一个 UInt16 类型的伪随机数。

## func suggestUInt16(UInt16, UInt16)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
func suggestUInt16(l: UInt16, r: UInt16): UInt16
```

获取一个 UInt16 类型的伪随机数。

### 契约

参数：

- l: UInt16 - 可生成范围的最小值。
- r: UInt16 - 可生成范围的最大值。

返回值：

- UInt16 - 一个 UInt16 类型的伪随机数。
