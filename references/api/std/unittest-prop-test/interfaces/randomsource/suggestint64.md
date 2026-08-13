<!-- cj-doc kind="api-member" level="6" id="std.unittest.prop_test.interface.randomsource.suggestint64" parent="std.unittest.prop_test.interface.randomsource" -->
# RandomSource.suggestInt64

[← RandomSource](index.md)

本页汇总 4 个同名重载；先按签名选择，再读取对应契约。

## func suggestInt64()

### 签名

```cangjie role=signature
public open func suggestInt64(): Int64
```

获取一个 Int64 类型的伪随机数。

### 契约

返回值：

- Int64 - 一个 Int64 类型的伪随机数。

## func suggestInt64(Int64, Int64)

### 签名

```cangjie role=signature
func suggestInt64(l: Int64, r: Int64): Int64
```

获取一个 Int64 类型的伪随机数。

### 契约

参数：

- l: Int64 - 可生成范围的最小值。
- r: Int64 - 可生成范围的最大值。

返回值：

- Int64 - 一个 Int64 类型的伪随机数。

## func suggestInt64()

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
public open func suggestInt64(): Int64
```

获取一个 Int64 类型的伪随机数。

### 契约

返回值：

- Int64 - 一个 Int64 类型的伪随机数。

## func suggestInt64(Int64, Int64)

适用扩展：[extend Random](extensions/extend-random.md)。

### 签名

```cangjie role=signature
func suggestInt64(l: Int64, r: Int64): Int64
```

获取一个 Int64 类型的伪随机数。

### 契约

参数：

- l: Int64 - 可生成范围的最小值。
- r: Int64 - 可生成范围的最大值。

返回值：

- Int64 - 一个 Int64 类型的伪随机数。
