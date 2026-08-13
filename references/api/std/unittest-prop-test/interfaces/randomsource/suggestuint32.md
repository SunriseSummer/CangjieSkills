<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.suggestuint32" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.suggestUInt32

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func suggestUInt32()

### 签名

```cangjie role=signature
public open func suggestUInt32(): UInt32
```

获取一个 UInt32 类型的伪随机数。

### 契约

返回值：

- UInt32 - 一个 UInt32 类型的伪随机数。

## func suggestUInt32(UInt32, UInt32)

### 签名

```cangjie role=signature
func suggestUInt32(UInt32, UInt32): UInt32
```

获取一个 UInt32 类型的伪随机数。

### 契约

参数：

- l: UInt32 - 可生成范围的最小值。
- r: UInt32 - 可生成范围的最大值。

返回值：

- UInt32 - 一个 UInt32 类型的伪随机数。

## func suggestUInt32()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func suggestUInt32(): UInt32
```

获取一个 UInt32 类型的伪随机数。

### 契约

返回值：

- UInt32 - 一个 UInt32 类型的伪随机数。

## func suggestUInt32(UInt32, UInt32)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
func suggestUInt32(UInt32, UInt32): UInt32
```

获取一个 UInt32 类型的伪随机数。

### 契约

参数：

- l: UInt32 - 可生成范围的最小值。
- r: UInt32 - 可生成范围的最大值。

返回值：

- UInt32 - 一个 UInt32 类型的伪随机数。
