<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.suggestint16" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.suggestInt16

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func suggestInt16()

### 签名

```cangjie role=signature
public open func suggestInt16(): Int16
```

获取一个 Int16 类型的伪随机数。

### 契约

返回值：

- Int16 - 一个 Int16 类型的伪随机数。

## func suggestInt16(Int16, Int16)

### 签名

```cangjie role=signature
func suggestInt16(l: Int16, r: Int16): Int16
```

获取一个 Int16 类型的伪随机数。

### 契约

参数：

- l: Int16 - 可生成范围的最小值。
- r: Int16 - 可生成范围的最大值。

返回值：

- Int16 - 一个 Int16 类型的伪随机数。

## func suggestInt16()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func suggestInt16(): Int16
```

获取一个 Int16 类型的伪随机数。

### 契约

返回值：

- Int16 - 一个 Int16 类型的伪随机数。

## func suggestInt16(Int16, Int16)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
func suggestInt16(l: Int16, r: Int16): Int16
```

获取一个 Int16 类型的伪随机数。

### 契约

参数：

- l: Int16 - 可生成范围的最小值。
- r: Int16 - 可生成范围的最大值。

返回值：

- Int16 - 一个 Int16 类型的伪随机数。
