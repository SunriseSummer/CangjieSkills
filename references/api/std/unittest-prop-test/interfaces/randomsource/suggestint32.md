<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.suggestint32" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.suggestInt32

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func suggestInt32()

### 签名

```cangjie role=signature
public open func suggestInt32(): Int32
```

获取一个 Int32 类型的伪随机数。

### 契约

返回值：

- Int32 - 一个 Int32 类型的伪随机数。

## func suggestInt32(Int32, Int32)

### 签名

```cangjie role=signature
func suggestInt32(l: Int32, r: Int32): Int32
```

获取一个 Int32 类型的伪随机数。

### 契约

参数：

- l: Int32 - 可生成范围的最小值。
- r: Int32 - 可生成范围的最大值。

返回值：

- Int32 - 一个 Int32 类型的伪随机数。

## func suggestInt32()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func suggestInt32(): Int32
```

获取一个 Int32 类型的伪随机数。

### 契约

返回值：

- Int32 - 一个 Int32 类型的伪随机数。

## func suggestInt32(Int32, Int32)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
func suggestInt32(l: Int32, r: Int32): Int32
```

获取一个 Int32 类型的伪随机数。

### 契约

参数：

- l: Int32 - 可生成范围的最小值。
- r: Int32 - 可生成范围的最大值。

返回值：

- Int32 - 一个 Int32 类型的伪随机数。
