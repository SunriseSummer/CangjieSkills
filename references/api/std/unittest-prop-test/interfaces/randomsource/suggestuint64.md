<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.suggestuint64" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.suggestUInt64

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func suggestUInt64()

### 签名

```cangjie role=signature
public open func suggestUInt64(): UInt64
```

获取一个 UInt64 类型的伪随机数。

### 契约

返回值：

- UInt64 - 一个 UInt64 类型的伪随机数。

## func suggestUInt64(UInt64, UInt64)

### 签名

```cangjie role=signature
func suggestUInt64(l: UInt64, r: UInt64): UInt64
```

获取一个 UInt64 类型的伪随机数。

### 契约

参数：

- l: UInt64 - 可生成范围的最小值。
- r: UInt64 - 可生成范围的最大值。

返回值：

- UInt64 - 一个 UInt64 类型的伪随机数。

## func suggestUInt64()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func suggestUInt64(): UInt64
```

获取一个 UInt64 类型的伪随机数。

### 契约

返回值：

- UInt64 - 一个 UInt64 类型的伪随机数。

## func suggestUInt64(UInt64, UInt64)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
func suggestUInt64(l: UInt64, r: UInt64): UInt64
```

获取一个 UInt64 类型的伪随机数。

### 契约

参数：

- l: UInt64 - 可生成范围的最小值。
- r: UInt64 - 可生成范围的最大值。

返回值：

- UInt64 - 一个 UInt64 类型的伪随机数。
